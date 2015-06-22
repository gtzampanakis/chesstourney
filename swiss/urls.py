from django.conf.urls import url

from . import views

urlpatterns = [
	url(r'^$', views.index, name='index'),
	url(r'^players$', views.players, name='players'),
	url(r'^tournaments$', views.tournaments, name='tournaments'),
]

