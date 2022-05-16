import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ninja Study',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
      ),
      home: LoginPage(),
    );
  }
}
