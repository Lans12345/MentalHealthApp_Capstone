import 'package:flutter/material.dart';
import 'package:mental_health/auth/login_page.dart';
import 'package:mental_health/services/error.dart';
import 'package:mental_health/widgets/dialog.dart';

import 'package:mental_health/widgets/text.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/image.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GetStorage box = GetStorage();

  final List<bool> _isSelected = [true, false];

  late String gender = 'Male';
  late String username = '';
  late String password = '';
  late String name = '';
  late String contactNumber = '';
  late String address = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            image('assets/images/logo.png', 125, 125, EdgeInsets.zero),
            const SizedBox(
              height: 30,
            ),
            textBold('Creating Account', 28.0, Colors.black),
            const SizedBox(
              height: 20,
            ),
            textBold('Login Credentials', 12.0, Colors.grey),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  username = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  password = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textBold("User's Information", 12.0, Colors.grey),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  name = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  labelText: 'Full Name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 9,
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  contactNumber = _input;
                },
                decoration: InputDecoration(
                  prefix: const Text('+639'),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  labelText: 'Contact Number',
                  labelStyle: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            textReg('Choose your Gender', 10, Colors.black),
            const SizedBox(
              height: 10,
            ),
            ToggleButtons(
                borderRadius: BorderRadius.circular(5),
                splashColor: Colors.grey,
                color: Colors.black,
                selectedColor: Colors.blue,
                children: const [
                  Icon(Icons.male),
                  Icon(Icons.female),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < _isSelected.length; index++) {
                      if (index == newIndex) {
                        _isSelected[index] = true;
                        if (_isSelected[0] == true) {
                          gender = 'Male';
                        } else {
                          gender = 'Female';
                        }
                      } else {
                        _isSelected[index] = false;
                      }
                    }
                  });
                },
                isSelected: _isSelected),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.grey, fontFamily: 'Quicksand'),
                onChanged: (_input) {
                  address = _input;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  labelText: 'Address',
                  labelStyle: const TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (username != '' && password != '') {
                    box.write('username', username);
                    box.write('password', password);
                    box.write('name', name);
                    box.write('contactNumber', '+639' + contactNumber);
                    box.write('gender', gender);
                    box.write('address', address);
                    dialog('', 'Account Created Succesfully!', LoginPage());
                  } else {
                    error('Invalid');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 60, right: 60),
                  child: textReg('Create Account', 14.0, Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}