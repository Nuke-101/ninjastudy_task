import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ninja Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
      ),
      home: LoginPage(),
    );
  }
}
