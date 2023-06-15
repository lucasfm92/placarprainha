import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const VolleyballScoreboard());
}

class VolleyballScoreboard extends StatelessWidget {
  const VolleyballScoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScoreboardPage(),
    );
  }
}

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  int scoreA = 0;
  int scoreB = 0;

  void incrementScoreA() {
    setState(() {
      scoreA++;
    });
  }

  void decrementScoreA() {
    setState(() {
      if (scoreA > 0) {
        scoreA--;
      }
    });
  }

  void incrementScoreB() {
    setState(() {
      scoreB++;
    });
  }

  void decrementScoreB() {
    setState(() {
      if (scoreB > 0) {
        scoreB--;
      }
    });
  }

  void resetScores() {
    setState(() {
      scoreA = 0;
      scoreB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(
                            Colors.red,
                          ),
                        ),
                        onPressed: incrementScoreA,
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(
                            Colors.red,
                          ),
                        ),
                        onPressed: decrementScoreA,
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '$scoreA',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.25,
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screenSize.width * 0.01,
                    height: screenSize.height * 0.6,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '$scoreB',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: incrementScoreB,
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: decrementScoreB,
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                  ),
                  onPressed: resetScores,
                  child: const Text('Zerar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
