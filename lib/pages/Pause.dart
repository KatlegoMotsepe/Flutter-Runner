// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Widgets/NavBar.dart';
import 'active.dart';
import 'home.dart';

class PausePage extends StatelessWidget {
  const PausePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text("Pause",
              style: TextStyle(fontSize: 40, color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 241, 172, 70),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivePage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text(
                    "Resume",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                const Text("   "),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: 'Home',
                              )),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text(
                    "Stop",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
