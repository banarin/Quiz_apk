import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_vi_leger/questionReponse.dart';
import 'package:audioplayers/audioplayers.dart';

class quizScreen extends StatefulWidget {
  const quizScreen({super.key});

  @override
  State<quizScreen> createState() => _quizScreenState();
}

class _quizScreenState extends State<quizScreen> {
  List<Question> questions = getQuestionList();
  int questionIndex = 0;
  Reponse? _selectedResponse;
  int score = 0;
  bool choose = false;
  bool next = false;
  bool isCorrect = false;
  Color isCorretColor = Colors.red;
  int? selectedIndex;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B4F72),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Quiz: ${questionIndex + 1}/${questions.length.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              const SizedBox(
                height: 10,
              ),
              questionCard(),
              _anserws(),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      questions[questionIndex].img_question,
                    ),
                    fit: BoxFit.cover,
                  )),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                questions[questionIndex].question,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> playFailed() async {
    await player.play(AssetSource('audio/alert.wav'));
  }

  Future<void> playSuccess() async {
    await player.play(AssetSource('audio/valide.wav'));
  }

  _anserws() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width / 1.3,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                isCorrect =
                    questions[questionIndex].propotionList[index].isCorrect;
                setState(() {
                  if (isCorrect) {
                    playSuccess();
                    isCorretColor = Colors.green;
                    score++;
                  } else {
                    playFailed();
                    isCorretColor = Colors.red;
                  }
                });
                print(isCorrect);
                if (questionIndex == questions.length - 1) {
                  dialog(context);
                }
              });
              if (questionIndex != questions.length - 1) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                  setState(() {
                    selectedIndex = -1;
                  });
                  questionIndex++;
                });
              }
              if (questionIndex < questions.length - 1) {
                loading(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: selectedIndex == index ? isCorretColor : Colors.white,
                ),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 3,
                child: Center(
                  child: Text(
                    questions[questionIndex].propotionList[index].porposition,
                    
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future loading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
  }

  Future dialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Score: ${score}/${questions.length}"),
            content: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      5), // Ajoutez le rayon de bordure souhaité
                ),
              ),
              onPressed: () {
                setState(() {
                  score = 0;
                  questionIndex = 0;
                  selectedIndex = -1;
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Recommencez",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          );
        });
  }
}
