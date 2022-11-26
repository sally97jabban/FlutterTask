import 'package:dartz/dartz.dart';
import 'package:fluttertask/features/questions/domain/repositories/questions_repository.dart';

import '../../../../cors/error/failures.dart';
import '../entities/question.dart';

class GetAllQuestionsUserCase{
 final QuestionsRepository repository;

 GetAllQuestionsUserCase(this.repository);
 Future <Either<Failure,List<Question>>> call()async{
   return await repository.getAllQuestions();
 }
}