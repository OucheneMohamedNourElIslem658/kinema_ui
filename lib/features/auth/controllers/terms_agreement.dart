import 'package:get/get.dart';

class TermsAgreementController extends GetxController {
  final terms = [
    {
      'term': 'I want to receive email messages from Kinema to remindme of my reservations.',
      'isChecked': false
    },
    {
      'term': 'Share my registration data with Kinema content providers for marketing purposes.',
      'isChecked': false
    }
  ];

  var isAllChecked = false;

  void checkTerm(int index) {
    final isChecked = terms[index]['isChecked']as bool;
    terms[index]['isChecked'] = !isChecked;
    update();
  }

  void updateIsAllChecked(){
    isAllChecked = terms.every((term) => term['isChecked'] as bool);
  }
}