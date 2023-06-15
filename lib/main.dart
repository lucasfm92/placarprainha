import 'package:flutter/material.dart';

void main() => runApp(const VolleyballScoreboard());

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Placar Deixa Que Eu Deixo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    const Text(
                      'Time A',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      '$scoreA',
                      style: const TextStyle(fontSize: 120),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red), // Altere a cor aqui
                            ),
                            onPressed: incrementScoreA,
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red), // Altere a cor aqui
                            ),
                            onPressed: decrementScoreA,
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 100),
                Column(
                  children: [
                    const Text(
                      'Time B',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      '$scoreB',
                      style: const TextStyle(fontSize: 120),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: ElevatedButton(
                            onPressed: incrementScoreB,
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: ElevatedButton(
                            onPressed: decrementScoreB,
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 75,
              width: 75,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Altere a cor aqui
                ),
                onPressed: resetScores,
                child: const Text('Zerar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
