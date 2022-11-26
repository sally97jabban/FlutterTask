import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_bloc.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_state.dart';

import '../widgets/loading_widget.dart';
import '../widgets/message_display_widget.dart';
import '../widgets/questions_list_widget.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() => AppBar(title: Text('Questions'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:
          BlocBuilder<QuestionsBloc, QuestionsState>(builder: (context, state) {
        if (state is LoadingQuestionsState) {
          return LoadingWidget();
        } else if (state is LoadedQuestionsState) {
          return PostListWidget(questions: state.questions);
        } else if (state is ErrorQuestionsState) {
          return MessageDisplayWidget(message: state.message);
        }
        return Text("erroe");
      }),
    );
  }
}
