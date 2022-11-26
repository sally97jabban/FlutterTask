import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';
import 'package:fluttertask/features/questions/presentation/pages/question_detail_page.dart';

class PostListWidget extends StatelessWidget {
  final List<Question> questions;

  PostListWidget({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, inde) => Divider(
              thickness: 1,
            ),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(questions[index].id.toString()),
            title: Text(
              questions[index].title??"no text",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          QuestionDetailPage(question: questions[index])));
            },
          );
        });
  }
}
