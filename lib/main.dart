import 'package:flutter/material.dart';

void main() {
  runApp(const BasketballApp());
}

class BasketballApp extends StatefulWidget {
  const BasketballApp({super.key});

  @override
  State<BasketballApp> createState() => _BasketballAppState();
}

class _BasketballAppState extends State<BasketballApp> {
  int scoreA = 0;
  int scoreB = 0;
  int scoreFontSizeA = 170;
  int scoreFontSizeB = 170;

  void incrementScoreA(int value) {
    setState(() {
      scoreA += value;
      scoreFontSizeA = scoreA > 99 ? 110 : (scoreA > 9 ? 160 : 170);
    });
  }

  void incrementScoreB(int value) {
    setState(() {
      scoreB += value;
      scoreFontSizeB = scoreB > 99 ? 110 : (scoreB > 9 ? 160 : 170);
    });
  }

  void resetScores() {
    setState(() {
      scoreA = 0;
      scoreB = 0;
      scoreFontSizeA = 170;
      scoreFontSizeB = 170;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text(
            "Points Counter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreColumn(
                  teamName: "Team A",
                  score: scoreA,
                  scoreFontSize: scoreFontSizeA,
                  onIncrement: incrementScoreA,
                ),
                const SizedBox(
                  height: 410,
                  child: VerticalDivider(color: Colors.grey, thickness: 1),
                ),
                ScoreColumn(
                  teamName: "Team B",
                  score: scoreB,
                  scoreFontSize: scoreFontSizeB,
                  onIncrement: incrementScoreB,
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: resetScores,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(240, 45),
                shadowColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreColumn extends StatelessWidget {
  final String teamName;
  final int score;
  final int scoreFontSize;
  final Function(int) onIncrement;

  const ScoreColumn({
    required this.teamName,
    required this.score,
    required this.scoreFontSize,
    required this.onIncrement,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          teamName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$score",
          style: TextStyle(
            color: Colors.black,
            fontSize: scoreFontSize.toDouble(),
          ),
        ),
        ElevatedButton(
          onPressed: () => onIncrement(1),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(136, 45),
            shadowColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
          child: const Text(
            "Add 1 Point",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => onIncrement(2),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 45),
            shadowColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
          child: const Text(
            "Add 2 Points",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => onIncrement(3),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 45),
            shadowColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
          child: const Text(
            "Add 3 Points",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
