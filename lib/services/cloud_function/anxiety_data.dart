import 'package:cloud_firestore/cloud_firestore.dart';

Future addAnxiety(String name, String contactNumber, String gender,
    String address, String result, String profilePicture) async {
  final docUser = FirebaseFirestore.instance.collection('Anxiety Data').doc();

  final json = {
    'name': name,
    'contactNumber': contactNumber,
    'gender': gender,
    'address': address,
    'result': result,
    'profilePicture': profilePicture,
    'id': docUser.id,
    'type': 'Anxiety',
  };

  await docUser.set(json);
}
