import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum direction { UP, DOWN, LEFT, RIGHT }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double playerX = -0.2;
  double brickWidth = 0.4;
  int playerScore = 0;

  double enemyX = -0.2;
  int enemyScore = 0;

  double ballx = 0;
  double bally = 0;

  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.RIGHT;
  bool gameStarted = false;
  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      updatedDirection();

      moveBall();

      moveEnemy();

      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _showDialog(false);
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _showDialog(true);
      }
    });
  }

  bool isEnemyDead() {
    if (bally <= -1) {
      return true;
    }
    return false;
  }

  void moveEnemy() {
    setState(() {
      enemyX = ballx;
    });
  }

  void _showDialog(bool enemyDied) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.purple,
            title: Center(
              child: Text(
                enemyDied ? "Pink Wins" : "Purple Wins",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      padding: EdgeInsets.all(7),
                      color: Colors.purple[100],
                      child: Text(
                        "Play Again",
                        style: TextStyle(
                            color: enemyDied
                                ? Colors.pink[300]
                                : Colors.purple[000]),
                      )),
                ),
              )
            ],
          );
        });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      gameStarted = false;
      ballx = 0;
      bally = 0;
      playerX = -0.2;
      enemyX = -0.2;
    });
  }

  bool isPlayerDead() {
    if (bally >= 1) {
      return true;
    }
    return false;
  }

  void updatedDirection() {
    setState(() {
      if (bally >= 0.9 && playerX + brickWidth >= ballx && playerX <= ballx) {
        ballYDirection = direction.UP;
      } else if (bally <= -0.9) {
        ballYDirection = direction.DOWN;
      }
      if (ballx >= 1) {
        ballXDirection = direction.LEFT;
      } else if (ballx <= -1) {
        ballXDirection = direction.RIGHT;
      }
    });
  }

  void moveBall() {
    setState(() {
      if (ballYDirection == direction.DOWN) {
        bally += 0.01;
      } else if (ballYDirection == direction.UP) {
        bally -= 0.01;
      }
    });
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballx -= 0.01;
      } else if (ballXDirection == direction.RIGHT) {
        ballx += 0.01;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerX - 0.1 <= -1)) {
        playerX -= 0.1;
      }
    });
  }

  void moveRight() {
    if (!(playerX + brickWidth >= 1)) {
      playerX += 0.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          moveRight();
        }
        if (details.delta.dx < 0) {
          moveLeft();
        }
      },
      onTap: startGame,
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
              child: Stack(
            children: [
              Welcome(gameStarted),
              Brick(enemyX, -0.9, brickWidth, true),
              Score(gameStarted, enemyScore, playerScore),
              Ball(ballx, bally),
              Brick(playerX, 0.9, brickWidth, false)
            ],
          ))),
    );
  }
}

class Welcome extends StatelessWidget {
  final bool gameStarted;
  Welcome(this.gameStarted);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, -0.2),
        child: Text(
          gameStarted ? "" : "T A P T O P L A Y",
          style: TextStyle(color: Colors.white),
        ));
  }
}

class Ball extends StatelessWidget {
  final x;
  final y;
  Ball(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        width: 20,
        height: 20,
      ),
    );
  }
}

class Brick extends StatelessWidget {
  final x;
  final y;
  final brickWidth;
  final isEnemy;
  Brick(this.x, this.y, this.brickWidth, this.isEnemy);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment((2 * x + brickWidth) / (2 - brickWidth), y),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment(0, 0),
            color: isEnemy ? Colors.purple[500] : Colors.pink[300],
            height: 20,
            width: MediaQuery.of(context).size.width * brickWidth / 2,
          ),
        ));
  }
}

class Score extends StatelessWidget {
  final gameStarted;
  final enemyScore;
  final playerScore;
  Score(
    this.gameStarted,
    this.enemyScore,
    this.playerScore,
  );
  @override
  Widget build(BuildContext context) {
    return gameStarted
        ? Stack(children: [
            Container(
                alignment: Alignment(0, 0),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.grey[800],
                )),
            Container(
                alignment: Alignment(0, -0.3),
                child: Text(
                  enemyScore.toString(),
                  style: TextStyle(color: Colors.grey[800], fontSize: 100),
                )),
            Container(
                alignment: Alignment(0, 0.3),
                child: Text(
                  playerScore.toString(),
                  style: TextStyle(color: Colors.grey[800], fontSize: 100),
                )),
          ])
        : Container();
  }
}
