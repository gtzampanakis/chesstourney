import logging
from django.contrib import admin, messages

from .models import Player, Tournament, Match

LOGGER = logging.getLogger(__name__)

def progress_to_next_round(modeladmin, request, queryset):
	for tourney in queryset:
		try:
			tourney.create_fixtures()
		except Exception as e:
			LOGGER.exception(e)
			modeladmin.message_user(request, str(e), messages.ERROR)

def Update_ratings(modeladmin, request, queryset):
	for tourney in queryset:
		try:
			nrated = tourney.update_ratings()
			modeladmin.message_user(request, 
								'Rated %s matches.' % nrated,
								messages.INFO)
		except Exception as e:
			LOGGER.exception(e)
			modeladmin.message_user(request, str(e), messages.ERROR)
	

class PlayerAdmin(admin.ModelAdmin):
	list_display = ['name', 'rating']

class TournamentAdmin(admin.ModelAdmin):
	list_display = ['name', 'rounds', 'current_round', 'is_finished', 'can_proceed']
	actions = [progress_to_next_round, Update_ratings]

class MatchAdmin(admin.ModelAdmin):
	list_editable = ['result']
	list_display = [lambda m: str(m), 'tournament', 'round', 'result']
	ordering = ['result', '-round']

admin.site.register(Player, PlayerAdmin)
admin.site.register(Tournament, TournamentAdmin)
admin.site.register(Match, MatchAdmin)

