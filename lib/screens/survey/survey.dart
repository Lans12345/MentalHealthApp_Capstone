import 'package:flutter/material.dart';
import 'package:mental_health/screens/home.dart';
import 'package:mental_health/screens/survey/surveys/survey_anxiety.dart';
import 'package:mental_health/screens/survey/surveys/survey_depression.dart';
import 'package:mental_health/screens/survey/surveys/survey_stress.dart';
import 'package:mental_health/widgets/appbar.dart';
import 'package:mental_health/widgets/button.dart';
import 'package:mental_health/widgets/text.dart';
import 'package:get/get.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appbar('Survey'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: textBold('Test For:', 24, Colors.black),
                )),
            const SizedBox(
              height: 50,
            ),
            button(
              onPressed: () {
                Get.off(() => const SurveyStress(),
                    transition: Transition.zoom);
              },
              color: Colors.blue[200]!,
              label: 'STRESS',
            ),
            const SizedBox(
              height: 30,
            ),
            button(
              onPressed: () {
                Get.to(() => const SurveyAnxiety(),
                    transition: Transition.zoom);
              },
              color: Colors.green[200]!,
              label: 'ANXIETY',
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.purple[200],
              onPressed: () {
                Get.to(() => const SurveyDepression(),
                    transition: Transition.zoom);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                child: textReg(
                  'DEPRESSION',
                  18,
                  Colors.white,
                ),
              ),
            ),
            const Expanded(child: SizedBox(height: 50)),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.teal,
              onPressed: () {
                Get.to(() => HomePage(), transition: Transition.zoom);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: textReg(
                  'Back to Home',
                  12,
                  Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
