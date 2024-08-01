import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ButtomNavBarContoller extends GetxController {
  final options = [
    {
      'title': 'home',
      'icon': 'assets/icons/home.svg',
      'isSelected': true
    },
    {
      'title': 'program',
      'icon': 'assets/icons/program.svg',
      'isSelected': false
    },
    {
      'title': 'trailers',
      'icon': 'assets/icons/trailers.svg',
      'isSelected': false
    },
    {
      'title': 'Fidelty Market',
      'icon': 'assets/icons/gifts.svg',
      'isSelected': false
    },
    {
      'title': 'Profile',
      'icon': 'assets/icons/profile.svg',
      'isSelected': false
    },
  ];

  void selectOption(int index,StatefulNavigationShell navigationShell){
    for (var i = 0; i < options.length; i++) {
      if (i == index) {
        options[i]['isSelected'] = true;
      } else {
        options[i]['isSelected'] = false;
      }
      update();
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}