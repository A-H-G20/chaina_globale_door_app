import 'package:chaina_globale_door/users/model/user.dart';
import 'package:chaina_globale_door/users/userPreferences/user_preferences.dart';
import 'package:get/get.dart';

class CurrentUser extends GetxController {
  // ignore: prefer_final_fields
  Rx<User> _currentUser = User(0, '', '', '').obs;
  User get user => _currentUser.value;

  getUserInfo() async {
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value= getUserInfoFromLocalStorage!;
  }
}
