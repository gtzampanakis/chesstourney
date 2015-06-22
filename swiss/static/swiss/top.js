var SWISS_PREFIX = '/swiss/';

var Player = Backbone.Model.extend({

});

var Tournament = Backbone.Model.extend({

});

function parse_serialized(ser) {
	var result = [ ];
	for (var i = 0; i < ser.length; i++) {
		result[i] = ser[i].fields;
		result[i].pk = ser[i].pk;
	}
	return result;
}

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

var player_columns = [
	{
		name: "id",
		className: 'foobar',
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
	}
];



players_inst = new Players;
tournaments_inst = new Tournaments;

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


$(document).ready(function() {

	$('#players_list')
		.append(players_filter.render().el)
		.append(players_grid.render().el)
		.append(players_paginator.render().el)
	;

	$('#tournaments_list')
		.append(tournaments_filter.render().el)
		.append(tournaments_grid.render().el)
		.append(tournaments_paginator.render().el)
	;


	players_inst.fetch({ reset: true });
	tournaments_inst.fetch({ reset: true });

})
