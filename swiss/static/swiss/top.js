var SWISS_PREFIX = '/swiss/';

var Player = Backbone.Model.extend({

});

var Tournament = Backbone.Model.extend({

});

var Match = Backbone.Model.extend({

});

var Ranking = Backbone.Model.extend({

});


var PAGE_SIZE = 25;

var Players = Backbone.PageableCollection.extend({
	model: Player,
	url: SWISS_PREFIX + 'players',
	state: {
		pageSize: PAGE_SIZE
	},
	mode: 'client'
});

var Tournaments = Backbone.PageableCollection.extend({
	model: Tournament,
	url: SWISS_PREFIX + 'tournaments',
	state: {
		pageSize: PAGE_SIZE
	},
	mode: 'client'
});

var touridPassed = null;
var nameOfTouridPassed = null;

var Matches = Backbone.PageableCollection.extend({
	model: Match,
	url: function() {
		var u = SWISS_PREFIX + 'tournaments/matches/' + touridPassed;
		return u;
	},
	state: {
		pageSize: PAGE_SIZE
	},
	mode: 'client'
});

var Rankings = Backbone.PageableCollection.extend({
	model: Match,
	url: function() {
		var u = SWISS_PREFIX + 'tournaments/rankings/' + touridPassed;
		return u;
	},
	state: {
		pageSize: PAGE_SIZE
	},
	mode: 'client'
});

var player_columns = [
	{
		name: "id",
		label: "Player ID",
		editable: false,
		cell: Backgrid.IntegerCell.extend({
		  orderSeparator: ''
		})
	},
	{
		name: "name",
		label: "Name",
		editable: false,
		cell: "string"
	},
	{
		name: "nationality",
		label: "Nationality",
		editable: false,
		cell: "string"
	},
	{
		name: "rating",
		label: "Rating",
		editable: false,
		cell: "number"
	},
];

var tournament_columns = [
	{
		name: "id",
		label: "Tourney ID",
		editable: false,
		cell: Backgrid.IntegerCell.extend({
		  orderSeparator: ''
		})
	},
	{
		name: "name",
		label: "Name",
		editable: false,
		cell: "string"
	},
	{
		name: "rounds",
		label: "Total Rounds",
		editable: false,
		cell: "string"
	},
	{
		name: "rounds_done",
		label: "Rounds Done",
		editable: false,
		cell: "string"
	},
	{
		name: "is_finished",
		label: "Finished?",
		editable: false,
		cell: "string"
	},
	{
		name: "place",
		label: "Place",
		editable: false,
		cell: "string"
	},
	{
		name: "matches_url",
		label: "",
		editable: false,
		cell: "uri",
		formatter: {
			fromRaw: function(rawData, model) { return 'Matches'; },
			toRaw: function(formattedData, model) { }
		}
	},
	{
		name: "rankings_url",
		label: "",
		editable: false,
		cell: "uri",
		formatter: {
			fromRaw: function(rawData, model) { return rawData ? 'Rankings' : ''; },
			toRaw: function(formattedData, model) { }
		}
	}
];

var match_columns = [
	{
		name: "white",
		label: "White",
		editable: false,
		cell: "string"
	},
	{
		name: "black",
		label: "Black",
		editable: false,
		cell: "string"
	},
	{
		name: "round",
		label: "Round",
		editable: false,
		cell: "number",
		formatter: {
			fromRaw: function(rawData, model) { return parseInt(rawData); },
			toRaw: function(formattedData, model) { }
		}
	},
	{
		name: "date",
		label: "Date",
		editable: false,
		cell: "string"
	},
	{
		name: "result",
		label: "Result",
		editable: false,
		cell: "string"
	},
];

var ranking_columns = [
	{
		name: "rank",
		label: "Rank",
		editable: false,
		cell: "string"
	},
	{
		name: "player",
		label: "Player",
		editable: false,
		cell: "string"
	},
	{
		name: "score",
		label: "Score",
		editable: false,
		cell: "number",
		formatter: {
			fromRaw: function(rawData, model) { return parseFloat(rawData).toFixed(1); },
			toRaw: function(formattedData, model) { }
		}
	}
];



players_inst = new Players;
tournaments_inst = new Tournaments;
matches_inst = new Matches;
rankings_inst = new Rankings;

var players_grid = new Backgrid.Grid({
	columns: player_columns,
	collection: players_inst
});

var players_paginator = new Backgrid.Extension.Paginator({
	collection: players_inst
});

var players_filter = new Backgrid.Extension.ClientSideFilter({
	collection: players_inst,
	fields: ['name']
});


var tournaments_grid = new Backgrid.Grid({
	columns: tournament_columns,
	collection: tournaments_inst
});

var tournaments_paginator = new Backgrid.Extension.Paginator({
	collection: tournaments_inst
});

var tournaments_filter = new Backgrid.Extension.ClientSideFilter({
	collection: tournaments_inst,
	fields: ['name']
});

var matches_grid = new Backgrid.Grid({
	columns: match_columns,
	collection: matches_inst
});

var matches_paginator = new Backgrid.Extension.Paginator({
	collection: matches_inst
});

var matches_filter = new Backgrid.Extension.ClientSideFilter({
	collection: matches_inst,
	fields: ['name']
});

var rankings_grid = new Backgrid.Grid({
	columns: ranking_columns,
	collection: rankings_inst
});

var rankings_paginator = new Backgrid.Extension.Paginator({
	collection: rankings_inst
});

var rankings_filter = new Backgrid.Extension.ClientSideFilter({
	collection: rankings_inst,
	fields: ['name']
});

function removeTarget() {
	$('#center_list a').removeAttr('target');
}

function removeAdded() {
	$('li.added').remove();
}

var Router = Backbone.Router.extend({

	routes: {
		'listtournaments': 'listtournaments',
		'listplayers': 'listplayers',
		'listmatches/:tourid': 'listmatches',
		'listrankings/:tourid': 'listrankings'
	},

	listtournaments: function() {
		removeAdded();
		$('#routes li')
			.removeClass('active')
		;

		$('#listtournaments').addClass('active');

		$('#center_list')
			.empty()
			.append($('<h2>Tournaments</h2>'))
			.append(tournaments_filter.render().el)
			.append(tournaments_grid.render().el)
			.append(tournaments_paginator.render().el)
		;

		tournaments_inst.fetch({ 
				reset: true, 
				success: removeTarget
		});
	},

	listplayers: function() {
		removeAdded();
		$('#routes li')
			.removeClass('active')
		;

		$('#listplayers').addClass('active');

		$('#center_list')
			.empty()
			.append($('<h2>Players</h2>'))
			.append(players_filter.render().el)
			.append(players_grid.render().el)
			.append(players_paginator.render().el)
		;

		players_inst.fetch({ 
			reset: true,
			success: removeTarget
		});
	},

	listmatches: function(tourid) {

		removeAdded();
		touridPassed = tourid;

		$('#routes li')
			.removeClass('active')
		;

		$('#routes')
			.append('<li class="active added"><a href="">Matches</a></li>')
		;

		$('#center_list')
			.empty()
			.append($('<h2>Matches</h2><p>'))
			.append(matches_filter.render().el)
			.append(matches_grid.render().el)
			.append(matches_paginator.render().el)
		;

		matches_inst.fetch({ 
			reset: true,
			success: removeTarget
		});
	},

	listrankings: function(tourid) {

		removeAdded();
		touridPassed = tourid;

		$('#routes li')
			.removeClass('active')
		;

		$('#routes')
			.append('<li class="active added"><a href="">Rankings</a></li>')
		;

		$('#center_list')
			.empty()
			.append($('<h2>Rankings</h2><p>'))
			.append(rankings_grid.render().el)
			.append(rankings_paginator.render().el)
		;

		rankings_inst.fetch({ 
			reset: true,
			success: removeTarget
		});
	}

});


$(document).ready(function() {

	router = new Router();

	Backbone.history.start();

	// Default.
	if (!/#/.test(window.location)) {
		router.navigate('listtournaments', {trigger: true});
	}

})
