# chesstourney
A swiss-style chess tournament manager.

Tournaments can be added through the Admin panel. Each tournament needs at least 4 players. Once those are added fixtures can be generated through the "Progress to next round" action. The same action should be used in order to create new fixtures after a round has been played. A round is considered played when all its matches have a result set. Results are also set through the Admin panel.

When creating fixtures attempt is made not to have two players play each other twice. Also, attempt is made to have each player use white and black pieces equally.

Once a tournament reaches its pre-defined number of rounds the action "Update ratings" can be run, in which case the ELO ratings of the players involved are updated, taking into account the whole tournament.


