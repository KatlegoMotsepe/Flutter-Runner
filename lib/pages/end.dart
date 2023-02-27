import 'package:flutter/material.dart';

import '../Widgets/NavBar.dart';

// ignore: must_be_immutable
class EndPage extends StatelessWidget {
  EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 241, 172, 70),
      ),
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: const Text("brb"),
      ),
    );
  }
}
