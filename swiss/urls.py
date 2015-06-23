from django.conf.urls import url

from . import views

urlpatterns = [
	url(r'^$', views.index, name='index'),
	url(r'^players$', views.players, name='players'),
	url(r'^tournaments$', views.tournaments, name='tournaments'),
	url(r'^tournaments/rankings/(\d+)$', views.rankings, name='rankings'),
	url(r'^tournaments/matches/(\d+)$', views.matches, name='matches'),
]

