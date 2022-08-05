import 'package:flutter/material.dart';
import 'package:mental_health/screens/quote/list_authors.dart';
import 'package:mental_health/screens/quote/list_quotes.dart';
import 'package:mental_health/widgets/appbar.dart';
import 'package:mental_health/widgets/text.dart';

class ViewQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Motivational Quotes'),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: const Icon(
                Icons.bookmark_added,
                color: Colors.green,
              ),
              tileColor: Colors.white,
              title: textReg('"${quotes[index]}"', 24, Colors.black),
              subtitle: Padding(
                padding: const EdgeInsets.all(10.0),
                child: textBold('By: ' + author[index], 12, Colors.black),
              ),
            ),
          );
        }),
      ),
    );
  }
}
