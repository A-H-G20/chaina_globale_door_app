import 'package:chaina_globale_door/users/fragments/favorites_fragment_screen.dart';
import 'package:chaina_globale_door/users/fragments/home_fragment_screen.dart';
import 'package:chaina_globale_door/users/fragments/order_fragment_screen.dart';
import 'package:chaina_globale_door/users/fragments/profile_fragment_screen.dart';
import 'package:chaina_globale_door/users/userPreferences/current_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class DashboardOfFragments extends StatelessWidget {
  // ignore: prefer_final_fields
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  final List<Widget> _fragmentScreen = [
    HomeFragmentScreen(),
    FavoritesFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  final List _navigationButtonProperties = [
    {
      "active_icon": Icons.home,
      "none_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite,
      "none_active_icon": Icons.favorite_border,
      "label": "Favorite",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "none_active_icon": FontAwesomeIcons.box,
      "label": "Order",
    },
    {
      "active_icon": Icons.person,
      "none_active_icon": Icons.person_outlined,
      "label": "Profile",
    },
  ];
  // ignore: prefer_final_fields
  RxInt _indexNumber = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return  Scaffold(
          backgroundColor: Colors.lightBlue,
          body: SafeArea(child: Obx(() => _fragmentScreen[_indexNumber.value]),),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              onTap: (Value) {
                _indexNumber.value = Value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              items: List.generate(4, (index) {
                var navBtnProperty = _navigationButtonProperties[index];
                return BottomNavigationBarItem(
                    backgroundColor: Colors.lightBlue,
                    icon: Icon(navBtnProperty["none_active_icon"]),
                    activeIcon: Icon(navBtnProperty["active_icon"]),
                    label: navBtnProperty["label"],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
