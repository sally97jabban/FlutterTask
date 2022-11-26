import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';

class QuestionDetailWidget extends StatelessWidget {
  final Question question;

  QuestionDetailWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            question.title!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black54),
            textAlign: TextAlign.start,
          ),
          ListTile(
            leading: Text(
              "View Count",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            trailing: Text(
              question.view_count.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.red),
            ),
          ),
          ListTile(
            leading: Text(
              "Answer Count",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            trailing: Text(
              question.answer_count.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Link",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Text(
                  question.link.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
