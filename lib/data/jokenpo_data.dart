import 'dart:math';

class JokenpoData {
  List<String> cards = [
    'lib/res/paper.png',
    'lib/res/rock.png',
    'lib/res/scissors.png',
  ];

  String opponentCard = 'lib/res/default.png';
  String playerCard = 'lib/res/default.png';
  String resultGame = 'Result Game';

  int scoresPlayer = 0;
  int scoresOpponent = 0;

  void appCardRandom() {
    final randomCard = Random().nextInt(cards.length);
    opponentCard = cards[randomCard];
  }

  void restartGame() {
    scoresPlayer = 0;
    scoresOpponent = 0;
    resultGame = 'Result Game';
    opponentCard = 'lib/res/default.png';
    playerCard = 'lib/res/default.png';
  }

  void scores() {
    if (playerCard == cards[0]) {
      if (opponentCard == cards[0]) {
        resultGame = 'Tied';
        scoresOpponent += 0;
        scoresPlayer += 0;
      } else if (opponentCard == cards[1]) {
        resultGame = 'Player Win';
        scoresOpponent += 0;
        scoresPlayer++;
      } else if (opponentCard == cards[2]) {
        resultGame = 'Opponent Win';
        scoresOpponent++;
        scoresPlayer += 0;
      }
    } else if (playerCard == cards[1]) {
      if (opponentCard == cards[0]) {
        resultGame = 'Opponent Win';
        scoresOpponent++;
        scoresPlayer += 0;
      } else if (opponentCard == cards[1]) {
        resultGame = 'Tied';
        scoresOpponent += 0;
        scoresPlayer += 0;
      } else if (opponentCard == cards[2]) {
        resultGame = 'Player Win';
        scoresOpponent += 0;
        scoresPlayer++;
      }
    } else if (playerCard == cards[2]) {
      if (opponentCard == cards[0]) {
        resultGame = 'Player Win';
        scoresOpponent += 0;
        scoresPlayer++;
      } else if (opponentCard == cards[1]) {
        resultGame = 'Opponent Win';
        scoresOpponent++;
        scoresPlayer += 0;
      } else if (opponentCard == cards[2]) {
        resultGame = 'Tied';
        scoresOpponent += 0;
        scoresPlayer += 0;
      }
    }
  }
}
