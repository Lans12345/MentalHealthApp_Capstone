import 'package:flutter/material.dart';
import 'package:mental_health/auth/login_page.dart';
import 'package:mental_health/screens/diary/write_diary.dart';
import 'package:mental_health/screens/profile/profile_page.dart';
import 'package:mental_health/screens/quote/view_quotes.dart';
import 'package:mental_health/screens/survey/survey.dart';
import 'package:mental_health/services/error.dart';
import 'package:mental_health/widgets/appbar.dart';
import 'package:mental_health/widgets/dialog.dart';
import 'package:mental_health/widgets/home_container.dart';
import 'package:mental_health/widgets/image.dart';
import 'package:mental_health/widgets/text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
      appBar: appbar('Home'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  bool hasInternet =
                      await InternetConnectionChecker().hasConnection;
                  if (hasInternet == true) {
                    Get.to(() => WriteDiary(), transition: Transition.zoom);
                  } else {
                    error('No Internet Connection');
                  }
                },
                child: homeContainer('diary.png', 'Self Diary',
                    Colors.blue[100]!, Colors.blue[200]!, Colors.blue[200]!),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewQuote(), transition: Transition.zoom);
                },
                child: homeContainer('quotes.png', "Quote's Motivator",
                    Colors.pink[100]!, Colors.pink[200]!, Colors.pink[200]!),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const Survey(), transition: Transition.zoom);
                },
                child: homeContainer('qa.png', 'MHA Based QA',
                    Colors.blue[100]!, Colors.blue[200]!, Colors.blue[200]!),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  String driverContactNumber = '09090104355';
                  final _text = 'tel:$driverContactNumber';
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                },
                child: homeContainer(
                    'phone.png',
                    'TCD Support',
                    Colors.purple[100]!,
                    Colors.purple[200]!,
                    Colors.purple[200]!),
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
