import 'package:cloud_firestore/cloud_firestore.dart';

Future postDiary(
  String title,
  String content,
  String date,
  String name,
  String contactNumber,
  String address,
  String profilePicture,
) async {
  final docUser = FirebaseFirestore.instance.collection('Diary').doc(date);

  final json = {
    'title': title,
    'content': content,
    'date': date,
    'name': name,
    'contactNumber': contactNumber,
    'address': address,
    'profilePicture': profilePicture,
  };

  await docUser.set(json);
}
