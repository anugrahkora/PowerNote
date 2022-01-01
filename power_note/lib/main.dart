import 'package:flutter/material.dart';
import 'package:power_note/theme.dart';
import 'package:power_note/views/sign_in_screen.dart';
import 'package:power_note/views/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        darkTheme: darkTheme(context),
        theme: lightTheme(context),
        home: SignInScreen());
  }
}
