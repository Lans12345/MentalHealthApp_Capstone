import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:mental_health/screens/admin/admin_home.dart';
import 'package:mental_health/widgets/text.dart';

class SearchMessages extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        onPressed: () {
          if (query != '') {
            close(context, null);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('No Input. Cannot Procceed'),
              ),
            );
          }
        },
        icon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final box = GetStorage();

    String tdata = DateFormat("hh").format(DateTime.now());

    print(tdata);

    // TODO: implement buildSuggestions
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Diary')
            .where('name',
                isGreaterThanOrEqualTo: toBeginningOfSentenceCase(query))
            .where('name', isLessThan: '${toBeginningOfSentenceCase(query)}z')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('error');
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('waiting');
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return ListView.builder(
              itemCount: snapshot.data?.size ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ColoredBox(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        box.write('name', data.docs[index]['name']);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdminHome()));
                      },
                      trailing: const Icon(Icons.arrow_right),
                      leading: CircleAvatar(
                        maxRadius: 30,
                        minRadius: 30,
                        backgroundImage:
                            NetworkImage(data.docs[index]['profilePicture']),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textReg(data.docs[index]['name'], 14, Colors.black),
                          textReg(
                              'Contact #: ' + data.docs[index]['contactNumber'],
                              10,
                              Colors.grey),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
