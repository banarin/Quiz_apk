import 'package:flutter/material.dart';
import 'package:quiz_vi_leger/quizScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isbegin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1B4F72),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200.0,
              ),
              const Center(
                child: Text(
                  "Quiz Vi Leger",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const quizScreen()));
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2.0)),
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Center(
                      child: Text(
                        "Commencez",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              const Text(
                "By LECODEUR",
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ));
  }
}
