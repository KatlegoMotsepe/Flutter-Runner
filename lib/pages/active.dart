import 'package:dp_stopwatch/dp_stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/end.dart';

import '../Widgets/NavBar.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

late SafeArea safeArea;

class _ActivePageState extends State<ActivePage> {
  late final stopwatchViewModel = DPStopwatchViewModel(
    clockTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );

  bool pause = false;
  late Row row;

  Row isPaised() {
    if (pause == false) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              stopwatchViewModel.pause?.call();
              setState(() {
                pause = true;
              });
            },
            child: Image(
              height: 150,
              width: 150,
              image: AssetImage("assets/pause.png"),
            ),
          ),
        ],
      );
    } else {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              stopwatchViewModel.resume?.call();
              setState(() {
                pause = false;
              });
            },
            child: Image(
              height: 150,
              width: 150,
              image: AssetImage("assets/play.png"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EndPage(),
                ),
              );
            },
            child: Image(
              height: 150,
              width: 150,
              image: AssetImage("assets/stop.png"),
            ),
          ),
        ],
      );
    }
    return row;
  }

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
              "Active",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(0, 241, 172, 70),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        stopwatchViewModel.start?.call();
                      },
                      child: Image.asset(
                        'assets/running-man.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "Time :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            DPStopWatchWidget(
                              stopwatchViewModel,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Distance :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            Text(
                              "Current Speed : ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20),
                            Text(
                              "Current pace :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    isPaised(),
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
