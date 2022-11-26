import 'package:dartz/dartz.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';

import '../../../../cors/error/failures.dart';

abstract class QuestionsRepository {

 Future <Either<Failure,List<Question>>> getAllQuestions();
}