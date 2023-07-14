import 'package:flutter/material.dart';

import 'bmi_screen.dart';

class BmiResultScreen extends StatelessWidget {
  late int result;

  late bool isMale;

  late int age;

  BmiResultScreen(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Result'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getText(),
                      style: TextStyle(
                          color: textColor(),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      result.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 45),
                    ),
                    const Text(
                      'Normal BMI range:',
                      style: TextStyle(fontSize: 18, color: Colors.black26),
                    ),
                    const Text(
                      '18.5-25kg/m2',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    Text(
                      getAdvise(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BmiScreen())),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Recalculate',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getText() {
    if (result >= 25) {
      return 'OVERWEIGHT';
    } else if (result > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getAdvise() {
    if (result >= 25) {
      return 'You have a more than normal body weight.\n Try to do more Exercise';
    } else if (result > 18.5) {
      return 'You have a normal body weight.\nGood job!';
    } else {
      return 'You have a lower than normal body weight.\n Try to eat more';
    }
  }

  Color textColor() {
    if (result >= 25 || result <= 18.5) {
      return Colors.deepOrange;
    } else {
      return const Color(0xFF24D876);
    }
  }
}
/*
Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender:  ${isMale ? 'Male' : 'Female'}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age: $age',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        )
*/
