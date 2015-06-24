import json, datetime

import django.db.models.base
from django.shortcuts import render
from django.template import RequestContext
from django.http import HttpResponse
from django.core import serializers

from .models import *

def json_encode(obj):
	if isinstance(obj, datetime.date):
		result = obj.isoformat()
	elif isinstance(obj, datetime.datetime):
		result = obj.isoformat()
	elif isinstance(obj, django.db.models.base.ModelState):
		result = None
	else:
		raise TypeError(type(obj))
	return result

def rest(f):
	def function_to_return(*args, **kwargs):
		obj = f(*args, **kwargs)
		jsoned = json.dumps(obj, default = json_encode)
		http_response = HttpResponse(jsoned, content_type = 'application/json')
		return http_response
	return function_to_return



def index(request):
	context = RequestContext(request, {
	})
	return render(request, 'swiss/index.html', context)

@rest
def players(request, *args, **kwargs):
	result = Player.objects.all()
	return sorted([
			{
				'id': o.id,
				'name' : o.name,
				'nationality' : o.nationality,
				'rating': o.rating(),
			}
			for o in result
			if o.id != BYE_PLAYER_ID
	])

@rest
def tournaments(request, *args, **kwargs):
	result = Tournament.objects.all()
	return sorted([
			{
				'id': o.id,
				'name': o.name,
				'place' : o.place,
				'is_finished': 'Yes' if o.is_finished() else 'No',
				'rounds': o.rounds,
				'rounds_done': o.current_round(),
				'matches_url': '#listmatches/' + str(o.id),
				'rankings_url': '#listrankings/' + str(o.id),
			}
			for o in result
	])


@rest
def rankings(request, *args, **kwargs):
	tournament_id = args[0]
	tournament = Tournament.objects.get(pk = tournament_id)

	to_return = [ ]

	last_score = None
	last_rank = None
	for rank, (player, score) in enumerate(tournament.final_rankings(), 1):
		if score == last_score:
			rank = last_rank
		to_return.append(
			{
				'rank': rank,
				'player': str(player),
				'score': score,
			}
		)
		last_score = score
		last_rank = rank

	return to_return


@rest
def matches(request, *args, **kwargs):
	tournament_id = args[0]
	tournament = Tournament.objects.get(pk = tournament_id)
	return [
			{
				'white': str(match.white_player),
				'black': str(match.black_player),
				'date': match.date.isoformat() if match.date else '',
				'round': match.round,
				'result' : (
					'0.5-0.5' if match.result == DRAW
					else (
						'1-0' if match.result == WHITE_WIN
						else (
							'0-1' if match.result == BLACK_WIN
								else 'Not played'
						)
					)
				)
			}
			for match
			in tournament.match_set.all().order_by('round')
	]

