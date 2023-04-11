import 'package:flutter/material.dart';
import '../Widgets/NavBar.dart';
import 'Pause.dart';

class ActivePage extends StatelessWidget {
  const ActivePage({super.key});

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
            title: const Text("Active!",
                style: TextStyle(fontSize: 40, color: Colors.white)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 241, 172, 70),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      
                      width:double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: const [
                          SizedBox(height: 20),
                          Text(
                            "Distance :",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Put distance  here",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Time :",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Bring time here",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Current Speed : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Purt current speed here",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Current pace :",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Put the current pace  here",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PausePage()),
                      );
                    },
                  
                    child: const Text(
                      "Pause",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
