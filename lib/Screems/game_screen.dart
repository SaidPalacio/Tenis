import 'package:flutter/material.dart';
import 'package:prueba/Models/game_state.dart';

class GameScreen extends StatefulWidget {
  final GameState gameState;

  GameScreen({required this.gameState});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String? winner;

  void addPoint(int player) {
    setState(() {
      widget.gameState.incrementScore(player);
      winner = widget.gameState.checkWinner();
    });
  }

  void resetGame() {
    setState(() {
      widget.gameState.resetScores();
      winner = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juego de Tenis'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.gameState.player1} vs ${widget.gameState.player2}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            if (winner == null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerScoreColumn(widget.gameState.player1, widget.gameState.getScore(1), 1),
                  playerScoreColumn(widget.gameState.player2, widget.gameState.getScore(2), 2),
                ],
              ),
            ] else ...[
              Text(
                '$winner ha ganado el juego!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetGame,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Resetear Juego',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget playerScoreColumn(String playerName, String score, int player) {
    return Column(
      children: [
        Text(
          playerName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 10),
        Text(
          score,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => addPoint(player),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text(
            'Punto $playerName',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}