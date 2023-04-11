// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Widgets/NavBar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  // const HistoryPage({required Key key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

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
            title: const Text("History",
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
