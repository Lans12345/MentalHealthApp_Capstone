import 'package:flutter/material.dart';
import 'package:mental_health/screens/survey/questions.dart';
import 'package:mental_health/widgets/appbar.dart';
import 'package:mental_health/widgets/text.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  var _index = 0;

  var _isVisible = true;
  var _isVisible2 = false;

  var count = 0;

  res() {
    if (count > 28 || count == 28) {
      return 'Normal Condition';
    } else if (count > 20 || count == 20) {
      return 'Suffering Stress';
    } else if (count > 13 || count == 13) {
      return 'Suffering Anxiety';
    } else {
      return 'Suffering Depression';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Survey'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: IndexedStack(
                    index: _index,
                    children: [
                      Center(child: questions('1', 'Q1')),
                      Center(child: questions('2', 'Q2')),
                      Center(child: questions('3', 'Q3')),
                      Center(child: questions('4', 'Q4')),
                      Center(child: questions('5', 'Q5')),
                      Center(child: questions('6', 'Q6')),
                      Center(child: questions('7', 'Q7')),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            textBold('Result', 12, Colors.black),
                            const SizedBox(
                              height: 14,
                            ),
                            textBold(res(), 18, Colors.black),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_index != 7) {
                        _index++;
                        count = count + 1;
                        print(count);
                      } else if (_index == 6) {
                        _isVisible = false;
                        _isVisible2 = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: textBold('Nearly Everyday', 18, Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_index != 7) {
                        _index++;
                        count = count + 2;
                        print(count);
                      } else if (_index == 6) {
                        _isVisible = false;
                        _isVisible2 = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child:
                        textBold('More than half the Time', 13, Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_index != 7) {
                        _index++;
                        count = count + 3;
                        print(count);
                      } else if (_index == 6) {
                        _isVisible = false;
                        _isVisible2 = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child:
                        textBold('Less than half the Time', 13, Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_index != 7) {
                        _index++;

                        count = count + 4;
                        print(count);
                      } else if (_index == 6) {
                        _isVisible = false;
                        _isVisible2 = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                    child: textBold('Sometimes', 18, Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_index != 7) {
                        _index++;
                        count = count + 5;
                        print(count);
                      } else if (_index == 6) {
                        _isVisible = false;
                        _isVisible2 = true;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: textBold('Almost Never', 18, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
