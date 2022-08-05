import 'package:cloud_firestore/cloud_firestore.dart';

Future postDiary(
  String title,
  String content,
  String date,
) async {
  final docUser = FirebaseFirestore.instance.collection('Diary').doc(date);

  final json = {
    'title': title,
    'content': content,
    'date': date,
  };

  await docUser.set(json);
}
