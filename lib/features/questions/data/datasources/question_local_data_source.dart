import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fluttertask/cors/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/question_model.dart';


abstract class QuestionLocalDataSource {
  Future<List<QuestionModel>> getCachedQuestion();
  Future<Unit> cacheQuestion(List<QuestionModel> QuestionModel);
}

const CACHED_POST = "CACHED_QUESTIONS";

class QuestionLocalDataSourceImpl implements QuestionLocalDataSource {
  final SharedPreferences sharedPreferences;

  QuestionLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheQuestion(List<QuestionModel> QuestionModels) {
    List questionModelToJson = QuestionModels.map<Map<String, dynamic>>(
        (questionModel) => questionModel.toJson()).toList();
    sharedPreferences.setString(
        CACHED_POST, json.encode(questionModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<QuestionModel>> getCachedQuestion() {
    final jsonString = sharedPreferences.getString(CACHED_POST);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<QuestionModel> jsonToQuestionModels = decodeJsonData
          .map<QuestionModel>((jsonQuestionModel) => QuestionModel.fromJson(jsonQuestionModel))
          .toList();
      return Future.value(jsonToQuestionModels);
    }else{
      throw EmptyCacheException();
    }
  }
}
