import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mental_health/widgets/appbar.dart';

import 'package:mental_health/widgets/image.dart';
import 'package:mental_health/widgets/text.dart';

class ProfilePage extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Users Profile"),
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
              box.read('name') ?? 'Not Available',
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
              box.read('gender') ?? 'Not Available',
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
              box.read('address') ?? 'Not Available',
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
