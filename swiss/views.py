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
	return render(request, 'swiss/index2.html', context)

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
				'name' : o.name,
				'place' : o.place,
				'is_finished': 'Yes' if o.is_finished() else 'No',
				'rounds_done': o.current_round(),
			}
			for o in result
	])


@rest
def rankings(request, *args, **kwargs):
	tournament_id = args[0]
	tournament = Tournament.objects.get(pk = tournament_id)
	return [
			{
				'player': str(player),
				'score': score,
			}
			for player, score
			in tournament.final_rankings()
	]


@rest
def matches(request, *args, **kwargs):
	tournament_id = args[0]
	tournament = Tournament.objects.get(pk = tournament_id)
	return [
			{
				'match': str(match),
				'white': str(match.white_player),
				'black': str(match.black_player),
				'round': match.round,
				'result' : (
					'1/2' if match.result == DRAW
					else (
						'1-0' if match.result == WHITE_WIN
						else '0-1'
					)
				)
			}
			for match
			in tournament.match_set.all().order_by('-round')
	]

