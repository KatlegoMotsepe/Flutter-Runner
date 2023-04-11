import 'package:flutter/material.dart';

import '../Widgets/NavBar.dart';

// ignore: must_be_immutable
class EndPage extends StatelessWidget {
  EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade200,
              Colors.orange.shade100,
              Colors.orange.shade100,
              Colors.white
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          drawer: NavBar(),
          appBar: AppBar(
            title: const Text("End",
                style: TextStyle(fontSize: 40, color: Colors.white)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 241, 172, 70),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                color: const Color.fromARGB(255, 241, 172, 70),
                child: Column(
                  children: [
                    // ListView(
                    //   children: ,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
