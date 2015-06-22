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

