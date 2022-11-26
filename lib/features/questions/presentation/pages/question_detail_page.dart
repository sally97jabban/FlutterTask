import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';

import '../widgets/question_detail_page/question_detail_widget.dart';

class QuestionDetailPage extends StatelessWidget {
  final Question question;

  QuestionDetailPage({required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text('Question Detailes'));

  Widget _buildBody() {
    return Center(child: Padding(padding: const EdgeInsets.all(10),
      child: QuestionDetailWidget(question:question,),));
  }
}
