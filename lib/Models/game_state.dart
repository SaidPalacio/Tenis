class GameState {
  String player1;
  String player2;
  int score1;
  int score2;

  GameState({
    required this.player1,
    required this.player2,
    this.score1 = 0,
    this.score2 = 0,
  });

  void resetScores() {
    score1 = 0;
    score2 = 0;
  }

  void incrementScore(int player) {
    if (player == 1) {
      score1++;
    } else {
      score2++;
    }
  }

  String getScore(int player) {
    int score = player == 1 ? score1 : score2;
    if (score >= 4) return 'Gana el juego';
    return ['0', '15', '30', '40'][score];
  }

  String? checkWinner() {
    if (score1 >= 4 && score1 - score2 >= 2) {
      return player1;
    }
    if (score2 >= 4 && score2 - score1 >= 2) {
      return player2;
    }
    return null;
  }
}
