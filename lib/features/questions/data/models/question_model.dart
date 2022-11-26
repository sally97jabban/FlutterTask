import 'package:fluttertask/features/questions/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(
      {required int id,
      required String title,
      required int answer_count,
      required int view_count,
      required String link,
      required int score,
//      required List<String> tags,
//      required String content_license,
//      required int last_edit_date,
//      required int last_activity_date,
//      required int creation_date
      })
      : super(
            id: id,
            title: title,
            answer_count: answer_count,
            view_count: view_count,
            link: link,
            score: score,
//            tags: tags,
//            content_license: content_license,
//            last_edit_date: last_edit_date,
//            last_activity_date: last_activity_date,
//            creation_date: creation_date
  );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['question_id'],
      title: json['title'],
      answer_count: json['answer_count'],
      link: json['link'],
      view_count: json['view_count'],
      score: json['score'],
//      tags: json['tags'].cast<String>(),
//      content_license: json['content_license'],
//      last_edit_date: json['last_edit_date'],
//      last_activity_date: json['last_activity_date'],
//      creation_date: json['creation_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': id,
      'title': title,
      'view_count': view_count,
      'answer_count': answer_count,
      'link': link,
//      'tags': tags,
      'score': score,
//      'last_activity_date': last_activity_date,
//      'last_edit_date': last_edit_date,
//      'creation_date': creation_date,
//      'content_license': content_license,
    };
  }
}
