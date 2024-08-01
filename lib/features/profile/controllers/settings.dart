import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  late List<Map<String, Object>> avatars;

  void selectAvatar(int index){
    for (var i = 0; i < avatars.length; i++) {
      avatars[i]['isSelected'] = false;
    }
    avatars[index]['isSelected'] = true;
    currentAvatarPath = avatars[index]['imagePath'] as String;
    update();
  }

  Future<void> changeAvatar(int index) async {
    final storage = GetStorage();
    final avatarPath = avatars[index] as String;
    await storage.write('avatar', avatarPath);
  }

  late String currentAvatarPath;

  void getCurrentAvatar(){
    final storage = GetStorage();
    final result = storage.read('avatar') as String ?;
    currentAvatarPath = result ?? 'assets/images/avatar1.png';
    for (var i = 0; i < avatars.length; i++) {
      if (avatars[i]['imagePath'] == currentAvatarPath) {
        selectAvatar(i);
      }
    }
  }

  @override
  void onInit() {
    avatars = [
      {'imagePath': 'assets/images/avatar1.png', 'isSelected': true},
      {'imagePath': 'assets/images/avatar2.png', 'isSelected': false},
      {'imagePath': 'assets/images/avatar3.png', 'isSelected': false},
      {'imagePath': 'assets/images/avatar4.png', 'isSelected': false},
      {'imagePath': 'assets/images/avatar5.png', 'isSelected': false},
      {'imagePath': 'assets/images/avatar6.png', 'isSelected': false},
    ];
    getCurrentAvatar();
    super.onInit();
  }

}