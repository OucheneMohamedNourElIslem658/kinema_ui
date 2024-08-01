import 'package:get/get.dart';

class GendersController extends GetxController {
  final genders = [
    {'type': 'Male', 'isSelected': false},
    {'type': 'Female', 'isSelected': false}
  ];

  var doesUserSelectedGender = false;

  void selectGender(int index){
    for (var i = 0; i < genders.length; i++) {
      if (index == i) {
        genders[i]['isSelected'] = true;
      } else {
        genders[i]['isSelected'] = false;
      }
    }
    doesUserSelectedGender = true;
    update();
  }
}