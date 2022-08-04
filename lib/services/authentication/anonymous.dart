import 'package:firebase_auth/firebase_auth.dart';

Future signIn() async {
  FirebaseAuth.instance.signInAnonymously();
}
