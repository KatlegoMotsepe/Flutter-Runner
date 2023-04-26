import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:binder/binder.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: const Splash()),
    );
  }
}
