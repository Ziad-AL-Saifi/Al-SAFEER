import '../List/list_of_city.dart';
import '../List/list_of_questions.dart';

class QusetionDetails {
  List<String>? details;
  List<List>? question;

  QusetionDetails({this.details, this.question});
}

List<QusetionDetails> data = [
  QusetionDetails(details: detailse_amarica, question: [
    america_Study_f1,
    america_Vist_Tourism,
    america_study_Masters,
    america_study_bachelordegree
  ]),
  QusetionDetails(details: detailse_canada, question: [
    canda_study,
    canda_study_Masters,
    canda_study_higherdiploma,
    canda_Vist_Tourism,
    canda_study_bachelordegree
  ]),
  QusetionDetails(
      details: detailse_britsh, question: [brtian_Study, brtian_Vist])
];
