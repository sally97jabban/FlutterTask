

import 'package:equatable/equatable.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitial extends QuestionsState {}

class LoadingQuestionsState extends QuestionsState {}

class LoadedQuestionsState extends QuestionsState {
  final List<Question> questions;

  LoadedQuestionsState({required this.questions});

  @override
  List<Object> get props => [questions];
}

class ErrorQuestionsState extends QuestionsState {
  final String message;

  ErrorQuestionsState({required this.message});

  @override
  List<Object> get props => [message];
}
