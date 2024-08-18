import 'package:chaina_globale_door/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'chaina_globale_door',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      
      ),
      home: FutureBuilder(
        builder : (context, dataSnapShot)
        {
        return LoginScreen(); 
      }, future: null, 
    ),
    );
  }

}

