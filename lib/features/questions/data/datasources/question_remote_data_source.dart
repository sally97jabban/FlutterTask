import 'dart:convert';
import 'package:fluttertask/cors/error/exception.dart';
import 'package:fluttertask/features/questions/data/models/question_model.dart';
import 'package:http/http.dart' as http;


abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getAllQuestions();
}

const BASE_URL = "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow";

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final http.Client client;
  QuestionRemoteDataSourceImpl({required this.client});
  @override
  Future<List<QuestionModel>> getAllQuestions() async {
    final response = await client.get(Uri.parse(BASE_URL),
        headers: {"Content_Type": "application/json"});
    print(response.statusCode);
    if (response.statusCode == 200) {
//      final List decodedJson = json.decode(response.body) as List;
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["items"];
      final List<QuestionModel> questionModels = data.map<QuestionModel>((jsonQuestionModel) => QuestionModel.fromJson(jsonQuestionModel)).toList();
      return questionModels;
    } else {
      throw ServerException();
    }
  }
}
