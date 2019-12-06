import 'package:flutter/material.dart';
import 'package:samsung_one_ui_phone/phone_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.black),
      ),
      home: PhoneHome(),
    );
  }
}
