import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertask/cors/error/failures.dart';
import 'package:fluttertask/features/questions/domain/usecases/get_all_questions.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_event.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_state.dart';

import '../../../../../cors/strings/failures.dart';
import '../../../domain/entities/question.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final GetAllQuestionsUserCase getAllQuestions;

  QuestionsBloc({required this.getAllQuestions}) : super(QuestionsInitial()) {
    on<QuestionsEvent>((event, emit) async {
      if (event is GetAllQuestionsEvent) {
        emit(LoadingQuestionsState());
        final FailureOrQuestions = await getAllQuestions();
        emit(_mapFailureOrQuestionsToState(FailureOrQuestions));
      } else if (event is RefreshQuestionsEvent) {
        emit(LoadingQuestionsState());
        final FailureOrQuestions = await getAllQuestions();
        emit(_mapFailureOrQuestionsToState(FailureOrQuestions));
      }
    });
  }

  QuestionsState _mapFailureOrQuestionsToState(
      Either<Failure, List<Question>> either) {
    return either.fold(
        (failure) =>
            ErrorQuestionsState(message: _mapFailureToMessage(failure)),
        (questions) => LoadedQuestionsState(questions: questions));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please try again later";
    }
  }
}
