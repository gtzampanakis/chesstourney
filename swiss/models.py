import logging, collections, datetime, random
from django.db import models
from django.core.exceptions import ValidationError

LOGGER = logging.getLogger(__name__)

DRAW = 0
WHITE_WIN = 1
BLACK_WIN = 2

MINIMUM_NPLAYERS = 4
MINIMUM_ROUNDS = 1

BYE_PLAYER_ID = 1

class Player(models.Model):
	name = models.CharField(max_length = 200)
	nationality = models.CharField(max_length = 3)
	dob = models.DateField()
	created_date = models.DateTimeField(auto_now_add = True)
	updated_date = models.DateTimeField(auto_now = True)

	def rating(self):
		return self.ratinghist_set.order_by('-date').first().rating

	def __unicode__(self):
		return '%s' % (self.name)

class CannotProceedException(Exception):
	pass


class Tournament(models.Model):
	name = models.CharField(max_length = 200)
	rounds = models.SmallIntegerField()
	place = models.CharField(max_length = 200, blank = True)
	players = models.ManyToManyField(Player)
	created_date = models.DateTimeField(auto_now_add = True)
	updated_date = models.DateTimeField(auto_now = True)

	def clean(self):
		if self.rounds < MINIMUM_ROUNDS:
			raise ValidationError('The minimum number of rounds is %s' % MINIMUM_ROUNDS)

	def __unicode__(self):
		return '%s' % (self.name)

	def rankings(self):
		matches = self.match_set.filter(result__isnull = False)

	def can_proceed(self):
		try:
			self.check_can_proceed()
			return True
		except CannotProceedException as e:
			LOGGER.exception(e)
			return False

	def check_can_proceed(self):
		current_round = self.current_round()

		if current_round == 0:
			if self.players.count() < MINIMUM_NPLAYERS:
				raise CannotProceedException('A tournament must have a minimum of %s players.'
																			% MINIMUM_NPLAYERS)


# If there exist unfinished matches we cannot proceed.
		if (self.match_set
					.filter(round__lte = current_round)
					.filter( result__isnull = True)).exists():
			raise CannotProceedException('Unfinished matches exist. Cannot proceed.')

# If the fixtures for next round have been generated we cannot proceed.
		if self.match_set.filter(round__gt = current_round).exists():
			raise CannotProceedException('Fixtures for next round have already been generated.')

		if current_round >= self.rounds:
			raise CannotProceedException('Tournament completed.')

		return True

	def is_finished(self):
		current_round = self.current_round()

		if current_round == self.rounds:
			if not self.match_set.filter(round = current_round).filter(result__isnull = True).exists():
				return True

		return False

	def scores(self):
		player_to_score = { }

		for player in self.players.all():
			player_to_score[player] = 0

		for match in self.match_set.filter(result__isnull = False):
			LOGGER.info('MATCH: %s', match)
			if match.result == DRAW:
				player_to_score[match.white_player] += .5
				player_to_score[match.black_player] += .5
			elif match.result == WHITE_WIN:
				player_to_score[match.white_player] += 1.
			elif match.result == BLACK_WIN:
				player_to_score[match.black_player] += 1.
			else:
				raise Exception('Unexpected result value %s' % result)

		return player_to_score


	def create_fixtures(self):

		self.check_can_proceed()
		
		player_to_score = self.scores()
		LOGGER.info('PLAYER_TO_SCORE: %s', player_to_score)

		distinct_scores = sorted(set(player_to_score.values()), reverse = True)
		LOGGER.info('DISTINCT_SCORES: %s', distinct_scores)

		score_to_group = { }
		for group_score in distinct_scores:
			LOGGER.info('GROUP_SCORE: %s', group_score)
			group = dict((p,s) for p,s in player_to_score.iteritems() if s == group_score)

			sorted_by_ranking = sorted(
					group,
					key = lambda p: p.rating(),
					reverse = True,
			)

			score_to_group[group_score] = sorted_by_ranking

			LOGGER.info('SORTED_BY_RANKING: %s', 
						[(p.name, p.rating()) for p in sorted_by_ranking])

		LOGGER.info('SCORE_TO_GROUP: %s', score_to_group)

		current_round = self.current_round()

		if current_round == self.rounds:
			raise Exception('The tournament is finished.')

		matches_played_already = list(self.match_set.filter(round__lt = current_round))
		LOGGER.info('MATCHES_PLAYED_ALREADY: %s', matches_played_already)


		def players_played_before(p1, p2):
			for match in matches_played_already:
				if match.white_player == p1 and match.black_player == p2:
					return True
				if match.black_player == p1 and match.white_player == p2:
					return True
			return False

		players_left_to_match = set(player_to_score.keys())

		group_scores_sorted = sorted(score_to_group.keys(), reverse = True)

		fixtures_generated = [ ]

		def add_fixture(match):
			LOGGER.info('STARTING ADD OF FIXTURE: %s', match)
			fixtures_generated.append(match)
			for pl in [match.white_player, match.black_player]:
				if pl.id != BYE_PLAYER_ID:
					LOGGER.info('PLAYERS_LEFT_TO_MATCH: %s', players_left_to_match)
					players_left_to_match.remove(pl)
			LOGGER.info('NEW FIXTURES_GENERATED: %s', fixtures_generated)


		for scorei in xrange(len(group_scores_sorted)):
			score = group_scores_sorted[scorei]
			group_handled = score_to_group[score]
			LOGGER.info('GROUP_HANDLED: %s', group_handled)

			def handle_non_fitting_player(nfpl):
				if scorei == len(group_scores_sorted) - 1:
# There is no other group. Give this player a bye.
					bye_match = Match(
							white_player = nfpl,
							black_player = Player.objects.get(id = BYE_PLAYER_ID),
							date = datetime.date.today(),
							result = WHITE_WIN,
							tournament = self,
							round = current_round + 1,
					)
					LOGGER.info('BYE_MATCH: %s', bye_match)
					add_fixture(bye_match)
				else:
# There is another group. Add nfpl to that group.
					score_to_group[group_scores_sorted[scorei + 1]].insert(0, nfpl)
					group_handled.pop(-1)

			LOGGER.info('NUMBER OF PLAYERS: %s', len(group_handled))

			odd_number_of_players = len(group_handled) % 2 == 1
			if odd_number_of_players:
				group_handled_to_iterate = group_handled[:-1]
				last_player = group_handled[-1]
			else:
				group_handled_to_iterate = group_handled

			effective_nplayers = len(group_handled_to_iterate)

			assert effective_nplayers % 2 == 0

			for playeri, player in enumerate(group_handled_to_iterate):
				if player in players_left_to_match:
					LOGGER.info('ATTEMPTING TO PAIR player %s', player)
					def mod_add(x):
						return (x + effective_nplayers/2) % effective_nplayers
					order_of_preference = [
							mod_add(x) 
							for x 
							in xrange(playeri, playeri + effective_nplayers)
					]
					LOGGER.info('ORDER_OF_PREFERENCE: %s', order_of_preference)
					for opp_candidate_i in order_of_preference:
						opp_candidate = group_handled_to_iterate[opp_candidate_i]
						LOGGER.info('OPP_CANDIDATE: %s', opp_candidate)
						if player == opp_candidate:
							continue
						elif opp_candidate not in players_left_to_match:
							continue
						elif players_played_before(player, opp_candidate):
							continue
						else:
							# Players have not played before. Pair them.
							p1_white_matches = player.matches_as_white.filter(
															tournament = self).count()
							p1_black_matches = player.matches_as_black.filter(
															tournament = self).count()
							p2_white_matches = opp_candidate.matches_as_white.filter(
															tournament = self).count()
							p2_black_matches = opp_candidate.matches_as_black.filter(
															tournament = self).count()
							LOGGER.info('(%s-%s), (%s-%s)' % (
											p1_white_matches, p1_black_matches,
											p2_white_matches, p2_black_matches))
							diff = (
									(p1_white_matches - p1_black_matches)
										- 
									(p2_white_matches - p2_black_matches)
							)

							match = Match(date = datetime.date.today(), 
														round = current_round + 1,
																	tournament = self)

							if diff > 0:
								match.white_player = opp_candidate
								match.black_player = player
							elif diff < 0:
								match.white_player = player
								match.black_player = opp_candidate
							else:
								if random.random() > .5:
									match.white_player = opp_candidate
									match.black_player = player
								else:
									match.white_player = player
									match.black_player = opp_candidate

							add_fixture(match)
							break
					else:
						handle_non_fitting_player(player)


			if odd_number_of_players:
				LOGGER.info('LAST_PLAYER: %s', last_player)
				if scorei == len(group_scores_sorted) - 1:
# There is n other group. Give this player a bye.
					bye_match = Match(
							white_player = last_player,
							black_player = Player.objects.get(id = BYE_PLAYER_ID),
							date = datetime.date.today(),
							result = WHITE_WIN,
							tournament = self,
							round = current_round + 1,
					)
					LOGGER.info('BYE_MATCH: %s', bye_match)
					add_fixture(bye_match)
				else:
# There is aother group. Add last_player to that group.
					score_to_group[group_scores_sorted[scorei + 1]].insert(0, last_player)
					group_handled.pop(-1)

			for match in fixtures_generated:
				LOGGER.info('SAVING MATCH: %s', match)
				match.save()


	def current_round(self):
		current_round = self.match_set.all().aggregate(models.Max('round')).get(
																	'round__max') or 0
		return current_round

	def final_rankings(self):
		scores = self.scores()
		ranked = sorted(scores, key = lambda p: (-scores[p], p.name), reverse = False)
		return [[player, scores[player]] for player in ranked]


	def update_ratings(self):
		nrated = 0
		is_finished = self.is_finished()
		if not is_finished:
			raise CannotProceedException('Tournament should be finished in order '
																		'for ratings to '
																		'be updated.')
		from .elo import match_increment
		for match in self.match_set.all().order_by('date'):
			
			if match.ratinghist_set.all().count() == 0:
				white_rating = match.white_player.rating()
				black_rating = match.black_player.rating()
				if match.result == WHITE_WIN:
					p_observed = 1.
				elif match.result == BLACK_WIN:
					p_observed = 0.
				elif match.result == DRAW:
					p_observed = 0.5

				inc = match_increment(white_rating, black_rating, p_observed)

				ratinghists_to_save = [ ]
				for pl, sign, r in [[match.white_player, 1, white_rating], [match.black_player, -1, black_rating]]:
					if pl.pk != BYE_PLAYER_ID:
						new_ratinghist = RatingHist(	player = pl,
														rating = r + sign * inc,
														date = match.date,
														after_match = match			)
						ratinghists_to_save.append(new_ratinghist)

				for rh in ratinghists_to_save:
					rh.save()
				nrated += 1

		return nrated




MATCH_RESULT_CHOICES = [
		[DRAW, '0.5-0.5'],
		[WHITE_WIN, '1-0'],
		[BLACK_WIN, '0-1'],
]

class Match(models.Model):
	white_player = models.ForeignKey(Player, related_name = 'matches_as_white')
	black_player = models.ForeignKey(Player, related_name = 'matches_as_black')
	date = models.DateField()
	result = models.SmallIntegerField(blank = True, null = True, choices = MATCH_RESULT_CHOICES)
	time_controls = models.CharField(max_length = 100, blank = True)
	pgn = models.TextField(blank = True)
	place = models.CharField(max_length = 200, blank = True)
	tournament = models.ForeignKey(Tournament)
	round = models.SmallIntegerField()
	created_date = models.DateTimeField(auto_now_add = True)
	updated_date = models.DateTimeField(auto_now = True)

	def played(self):
		if self.result is None: return 0
		else: return 1


	class Meta:
		verbose_name_plural = 'matches'

	def __unicode__(self):
		return '%s - %s' % (self.white_player, self.black_player)

class Ranks(models.Model):
	tournament = models.ForeignKey(Tournament)
	player = models.ForeignKey(Player)
	rank = models.SmallIntegerField()
	created_date = models.DateTimeField(auto_now_add = True)
	updated_date = models.DateTimeField(auto_now = True)

	def __unicode__(self):
		return '%s at %s, rank %s' % (self.player, self.tournament, self.rank)

class RatingHist(models.Model):
	player = models.ForeignKey(Player)
	rating = models.FloatField()
	date = models.DateField()
	after_match = models.ForeignKey(Match, null = True)
	created_date = models.DateTimeField(auto_now_add = True)
	updated_date = models.DateTimeField(auto_now = True)

	def __unicode__(self):
		return '%s %.2f on %s' % (self.player, self.rating, self.date)

