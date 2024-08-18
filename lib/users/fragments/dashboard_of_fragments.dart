import 'package:chaina_globale_door/users/userPreferences/current_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class DashboardOfFragments extends StatelessWidget {
  // ignore: prefer_final_fields
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return const Scaffold();
      },
    );
  }
}
