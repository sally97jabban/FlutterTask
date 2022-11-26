import 'package:fluttertask/cors/networke/network_info.dart';
import 'package:fluttertask/features/questions/data/datasources/question_local_data_source.dart';
import 'package:fluttertask/features/questions/data/datasources/question_remote_data_source.dart';
import 'package:fluttertask/features/questions/data/reositories/question_repository_impl.dart';
import 'package:fluttertask/features/questions/domain/repositories/questions_repository.dart';
import 'package:fluttertask/features/questions/domain/usecases/get_all_questions.dart';
import 'package:fluttertask/features/questions/presentation/bloc/questions/questions_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
//  Bloc
  sl.registerFactory(() => QuestionsBloc(getAllQuestions: sl()));

//Usecase

  sl.registerLazySingleton(() => GetAllQuestionsUserCase(sl()));

//Repository
  sl.registerLazySingleton<QuestionsRepository>(() => QuestionsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

//DataSources

  sl.registerLazySingleton<QuestionRemoteDataSource>(()=>QuestionRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<QuestionLocalDataSource>(()=>QuestionLocalDataSourceImpl(sharedPreferences: sl()));

//Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External
  final sharedPreferences = await SharedPreferences.getInstance();

sl.registerLazySingleton(()=>sharedPreferences);
sl.registerLazySingleton(()=>http.Client());
sl.registerLazySingleton(()=>InternetConnectionChecker());
}
