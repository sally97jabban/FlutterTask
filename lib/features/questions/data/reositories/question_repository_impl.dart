import 'package:dartz/dartz.dart';
import 'package:fluttertask/cors/error/exception.dart';
import 'package:fluttertask/cors/error/failures.dart';
import 'package:fluttertask/cors/networke/network_info.dart';
import 'package:fluttertask/features/questions/data/datasources/question_local_data_source.dart';
import 'package:fluttertask/features/questions/data/datasources/question_remote_data_source.dart';
import 'package:fluttertask/features/questions/domain/entities/question.dart';
import 'package:fluttertask/features/questions/domain/repositories/questions_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionRemoteDataSource remoteDataSource;
  final QuestionLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  QuestionsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Question>>> getAllQuestions() async {
    if(await networkInfo.icConnected){
      try{
        final remoteQuestion = await remoteDataSource.getAllQuestions();
        localDataSource.cacheQuestion(remoteQuestion);
        return Right(remoteQuestion);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
        final localQuestions = await localDataSource.getCachedQuestion();
        return Right(localQuestions);
      }on EmptyCacheException{
        return Left(EmptyCacheFailure());
      }
    }
  }
}
