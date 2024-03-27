const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

var database = admin.database();

exports.matchmaker = functions.database.ref('matchmaking/{playerId}')
    .onCreate((snap, context) => {

        var gameId = generateGameId();
        var fistPlayerCard = snap.val()['card'];
        var secondPlayerCard = null;
        database.ref('matchmaking').once('value').then(players => {
            var secondPlayer = null;
            players.forEach(player => {
                if (player.val()['gameId'] === "placeholder" && player.key !== context.params.playerId) {
                    secondPlayer = player;
                    secondPlayerCard = player.val()['card'];
                }
            });

            if (secondPlayer === null) return null;

            database.ref("matchmaking").transaction(function (matchmaking) {

                // If any of the players gets into another game during the transaction, abort the operation
                if (matchmaking === null || matchmaking[context.params.playerId]['gameId'] !== "placeholder" || matchmaking[secondPlayer.key]['gameId'] !== "placeholder") return matchmaking;

                matchmaking[context.params.playerId]['gameId'] = gameId;
                matchmaking[secondPlayer.key]['gameId'] = gameId;
                return matchmaking;

            }).then(result => {

                if (result.snapshot.child(context.params.playerId).val()['gameId'] !== gameId) return;

                var categories = ['weight', 'price', 'city_milage', 'power'];
                var winnerCategory = Math.floor(Math.random() * (3 - 0 + 1)) + 0;
                var p1Id = context.params.playerId;
                var p2Id = secondPlayer.key;
                var game = {
                    gameInfo: {
                        gameId: gameId,
                        playersIds: [context.params.playerId, secondPlayer.key],
                        cardIds: [fistPlayerCard['user_car_id'], secondPlayerCard['user_car_id']]
                    },
                    winner: p1Id,
                    category: winnerCategory
                };

                database.ref("games/" + gameId).set(game).then(snapshot => {
                    console.log("Game created successfully!")
                    return null;
                }).catch(error => {
                    console.log(error);
                });

                return null;

            }).catch(error => {
                console.log(error);
            });

            return null;
        }).catch(error => {
            console.log(error);
        });
    });

function generateGameId() {
    var possibleChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    var gameId = "";
    for (var j = 0; j < 20; j++) gameId += possibleChars.charAt(Math.floor(Math.random() * possibleChars.length));
    return gameId;
}