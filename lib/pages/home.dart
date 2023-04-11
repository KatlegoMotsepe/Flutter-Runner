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
  double? distance = 0.0;
  double? startLatitude = 0.0;
  double? startLongitude = 0.0;
  double? endLatitude = 0.0;
  double? endLongitude = 0.0;

  double? speed = 0.0;
  double? pace = 0.0;
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  //This is the main page or the home page.
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
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 241, 172, 70),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Container(
                        height: 170,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              "Total Distance :",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text("Put the total distance here")
                          ],
                        )),
                    const SizedBox(height: 20),
                    Container(
                        height: 170,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              "Average Pace :",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text("Put the average pace  here"),
                          ],
                        )),
                    const SizedBox(height: 20),
                    Container(
                        height: 170,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              "Avarage Speed (km/h) : ",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text("Put the total distance here")
                          ],
                        )),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EndPage()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text(
                            "End",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ),
                      ],
                    )
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
