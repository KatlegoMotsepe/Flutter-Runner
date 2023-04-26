import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/end.dart';
import 'package:flutter_application_1/pages/home.dart';
import '../Widgets/NavBar.dart';
import 'Pause.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

late SafeArea safeArea;

class _ActivePageState extends State<ActivePage> {
  bool pause = false;

  @override
  Widget build(BuildContext context) {
    if (pause == false) {
      safeArea = SafeArea(
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
                      Image.asset(
                        'assets/running-man.png',
                        height: 200,
                        width: 200,
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
                            children: const [
                              SizedBox(height: 20),
                              Text(
                                "Time :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Distance :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Current Speed : ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Current pace :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
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
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      safeArea = SafeArea(
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
              title: 
                  const Text(
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
                      Image.asset(
                        'assets/running-man.png',
                        height: 200,
                        width: 200,
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
                            children: const [
                              SizedBox(height: 20),
                              Text(
                                "Time :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Distance :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Current Speed : ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text(
                                "Current pace :",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
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
    return safeArea;
  }
}
