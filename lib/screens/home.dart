import 'package:flutter/material.dart';
import 'package:mental_health/auth/login_page.dart';
import 'package:mental_health/screens/profile/profile_page.dart';
import 'package:mental_health/widgets/dialog.dart';
import 'package:mental_health/widgets/home_container.dart';
import 'package:mental_health/widgets/image.dart';
import 'package:mental_health/widgets/text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 220,
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue[200]!,
                    Colors.blue[300]!,
                    Colors.blue[400]!,
                  ]),
                ),
                accountEmail:
                    textBold(box.read('contactNumber') ?? '', 12, Colors.white),
                accountName: textBold(box.read('name') ?? '', 18, Colors.white),
                currentAccountPicture: const CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: textBold('Profile', 14, Colors.black),
                onTap: () {
                  Get.to(() => ProfilePage(), transition: Transition.zoom);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: textBold('About', 14, Colors.black),
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationName: 'Mental Health Guide',
                      applicationIcon: image(
                          'assets/images/logo.png', 50, 50, EdgeInsets.zero),
                      applicationLegalese:
                          'This system is for Capstone Project',
                      applicationVersion: 'v1.0');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: textBold('Logout', 14, Colors.black),
                onTap: () {
                  dialogWithClose('Logout Confirmation',
                      'Are you sure you want to logout?', LoginPage());
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: textBold('Home', 24, Colors.white),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[400]!,
              Colors.pink[300]!,
              Colors.purple[400]!,
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              homeContainer('diary.png', 'Self Diary', Colors.blue[200]!,
                  Colors.blue[300]!, Colors.blue[400]!),
              const SizedBox(
                height: 20,
              ),
              homeContainer('quotes.png', "Quote's Motivator",
                  Colors.pink[200]!, Colors.pink[300]!, Colors.pink[400]!),
              const SizedBox(
                height: 20,
              ),
              homeContainer('qa.png', 'MHA Based QA', Colors.blue[100]!,
                  Colors.blue[200]!, Colors.blue[300]!),
              const SizedBox(
                height: 20,
              ),
              homeContainer('phone.png', 'TCD Support', Colors.purple[200]!,
                  Colors.purple[300]!, Colors.purple[400]!),
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
