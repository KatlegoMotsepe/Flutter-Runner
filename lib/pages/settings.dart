import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/home.dart';

import '../Widgets/NavBar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void setDistance() {}

  void vocalFeedback() {}
  bool yeah = false, yeah1 = false, yeah2 = false, yeah3 = false, yeah4 = false;

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
          backgroundColor: Colors.transparent,
          endDrawer: NavBar(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: const Text('Settings',
                style: TextStyle(fontSize: 40, color: Colors.white)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(0, 241, 172, 70),
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
                        children: [
                          const Text(
                            "Feedback Every :",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "200m",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.green,
                                // color of the round icon, which moves from right to left
                                thumbColor: Colors.white,
                                // when the switch is off
                                trackColor: Colors.grey.shade400,
                                value: yeah,
                                // boolean variable value
                                onChanged: (value) {
                                  setState(() {
                                    if (yeah == false) {
                                      yeah = true;
                                    } else if (yeah == true) {
                                      yeah = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "250m",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.green,
                                // color of the round icon, which moves from right to left
                                thumbColor: Colors.white,
                                // when the switch is off
                                trackColor: Colors.grey.shade400,
                                value: yeah1,
                                // boolean variable value
                                onChanged: (value) {
                                  setState(() {
                                    if (yeah1 == false) {
                                      yeah1 = true;
                                    } else if (yeah1 == true) {
                                      yeah1 = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "500m",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.green,
                                // color of the round icon, which moves from right to left
                                thumbColor: Colors.white,
                                // when the switch is off
                                trackColor: Colors.grey.shade400,
                                value: yeah2,
                                // boolean variable value
                                onChanged: (value) {
                                  setState(() {
                                    if (yeah2 == false) {
                                      yeah2 = true;
                                    } else if (yeah2 == true) {
                                      yeah2 = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "1km",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.green,
                                // color of the round icon, which moves from right to left
                                thumbColor: Colors.white,
                                // when the switch is off
                                trackColor: Colors.grey.shade400,
                                value: yeah3,
                                // boolean variable value
                                onChanged: (value) {
                                  setState(() {
                                    if (yeah3 == false) {
                                      yeah3 = true;
                                    } else if (yeah3 == true) {
                                      yeah3 = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Vocal Feedback",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.green,
                                // color of the round icon, which moves from right to left
                                thumbColor: Colors.white,
                                // when the switch is off
                                trackColor: Colors.grey.shade400,
                                value: yeah4,
                                // boolean variable value
                                onChanged: (value) {
                                  setState(() {
                                    if (yeah4 == false) {
                                      yeah4 = true;
                                    } else if (yeah4 == true) {
                                      yeah4 = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: "Home",
                                  )),
                        );
                      },
                      child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage("assets/home.png"),
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
