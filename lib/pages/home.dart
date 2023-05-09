import 'dart:async';
import 'package:flutter/material.dart';

import '../Widgets/NavBar.dart';
import 'settings.dart';
import 'history.dart';
import 'active.dart';
import 'end.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          endDrawer: NavBar(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/running-man.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Total Distance :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 50),
                          Text(
                            "Average Pace :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 50),
                          Text(
                            "Avarage Speed (km/h) : ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), // Set the shape to CircleBorder
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ActivePage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          "Let's Get\n  Active",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
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
