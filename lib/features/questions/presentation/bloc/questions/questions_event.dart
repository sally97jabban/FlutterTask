

import 'package:equatable/equatable.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();

  @override
  List<Object> get props => [];
}

class GetAllQuestionsEvent extends QuestionsEvent {}

class RefreshQuestionsEvent extends QuestionsEvent {}
