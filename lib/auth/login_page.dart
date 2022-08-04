import 'package:flutter/material.dart';
import 'package:mental_health/auth/signup_page.dart';
import 'package:mental_health/screens/home.dart';
import 'package:mental_health/services/authentication/anonymous.dart';
import 'package:mental_health/services/error.dart';
import 'package:mental_health/widgets/text.dart';
import 'package:get/get.dart';
import '../services/authentication/googleLogin.dart';
import '../widgets/image.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  late String username = '';
  late String password = '';

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              image('assets/images/logo.png', 250, 250, EdgeInsets.zero),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    username = _input;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
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
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Quicksand'),
                  onChanged: (_input) {
                    password = _input;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (box.read('username') == username &&
                        box.read('password') == password) {
                      signIn();
                      Get.off(() => HomePage(), transition: Transition.zoom);
                    } else {
                      error('Invalid Account');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 80, right: 80),
                    child: textReg('Login', 18.0, Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              textReg('or', 18.0, Colors.black),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    logInWithGoogle();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        image(
                          'assets/images/googlelogo.png',
                          25,
                          25,
                          EdgeInsets.zero,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        textReg('Login with Google', 18.0, Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textReg('No Account?', 14.0, Colors.black),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpPage(),
                          transition: Transition.zoom);
                    },
                    child: textBold('Create now', 15.0, Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
