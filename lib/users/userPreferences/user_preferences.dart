import 'dart:convert';

import 'package:chaina_globale_door/users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs {
  static Future<void> saveRemembeUser(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJasonData = jsonEncode(userInfo.toJson());

    await preferences.setString("currentUser", userJasonData);
  }
}
