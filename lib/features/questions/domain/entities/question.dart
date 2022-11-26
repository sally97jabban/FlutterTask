import 'package:equatable/equatable.dart';

class Question extends Equatable {
  int? id;
   String? title;
   int? view_count;
   int ?answer_count;
   String? link;
   int ?score;
//  List<String>? tags;
//   int? last_activity_date;
//   int? creation_date;
//   int ?last_edit_date;
//   String? content_license;

  Question(
      {required this.id,
      required this.title,
      required this.view_count,
      required this.answer_count,
      required this.score,
//      required this.tags,
//      required this.last_activity_date,
//      required this.creation_date,
//      required this.last_edit_date,
//      required this.content_license,
      required this.link});

  @override
  List<Object?> get props => [
        id,
        title,
        view_count,
        answer_count,
        score,
//        tags,
//        last_activity_date,
//        creation_date,
//        last_edit_date,
//        content_license,
        link
      ];
}
