import 'package:flutter/material.dart';
import '../Widgets/NavBar.dart';
import 'Pause.dart';

class ActivePage extends StatelessWidget {
  const ActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("Active!",
            style: TextStyle(fontSize: 40, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 172, 70),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                width: 400,
                color: const Color.fromARGB(255, 241, 172, 70),
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
                      "Current pacee :",
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
                  MaterialPageRoute(builder: (context) => const PausePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 241, 172, 70),
                ),
              ),
              child: const Text(
                "Pause",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
