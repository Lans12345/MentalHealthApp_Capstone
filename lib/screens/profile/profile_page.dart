import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:mental_health/widgets/image.dart';
import 'package:mental_health/widgets/text.dart';

class ProfilePage extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textReg(
          'Users Profile',
          22,
          Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[200]!,
              Colors.blue[300]!,
              Colors.blue[400]!,
            ]),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            image('assets/images/profile.png', 120, 120, EdgeInsets.zero),
            const SizedBox(
              height: 20,
            ),
            textBold(
              box.read('name'),
              18,
              Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            textReg(
              'Full Name',
              12,
              Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            textBold(
              box.read('gender'),
              18,
              Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            textReg(
              'Gender',
              12,
              Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            textBold(
              box.read('address'),
              18,
              Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            textReg('Address', 12, Colors.black),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
