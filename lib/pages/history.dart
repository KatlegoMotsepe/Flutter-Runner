// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';

import '../Widgets/NavBar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  // const HistoryPage({required Key key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class Entry {
  final String duration;
  final String distance;
  final String averageSpeed;
  final String topSpeed;

  Entry({
    required this.duration,
    required this.distance,
    required this.averageSpeed,
    required this.topSpeed,
  });
}

class _HistoryPage extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  void search() {
    if (searchController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green[300],
            title: Text(
              "Please fill in all fields",
              style: TextStyle(color: Colors.white),
            ), // Title of the dialog
            content: const SizedBox(
              height: 1,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"), // Button text
              ),
            ],
          );
        },
      );
      return;
    }
  }

  final searchController = TextEditingController();
  final List<Entry> entries = [
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '2h 15m',
        distance: '15 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '14.2 km/h'),
    Entry(
        duration: '0h 45m',
        distance: '5 km',
        averageSpeed: '7.8 km/h',
        topSpeed: '11.5 km/h'),
    Entry(
        duration: '3h 0m',
        distance: '20 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '15.1 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
    Entry(
        duration: '1h 30m',
        distance: '10 km',
        averageSpeed: '6.7 km/h',
        topSpeed: '12.3 km/h'),
  ];

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/running-man.png',
                  height: 100,
                  width: 100,
                ),
                const Text("History",
                    style: TextStyle(fontSize: 40, color: Colors.white)),
              ],
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(0, 241, 172, 70),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: const Color.fromARGB(0, 241, 172, 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Enter a date :',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: searchController,
                          autofocus: false,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: search,
                              child: Image(
                                height: 48,
                                width: 48,
                                image: AssetImage("assets/search.png"),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'eg. 2023/01/01',
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            Entry entry = entries[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromRGBO(223, 62, 0, 1),
                                    width: 0.25),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Customize the border radius if desired
                              ),
                              color: Colors.black12,
                              elevation:
                                  0, // set elevation to 0 for transparent card
                              child: ListTile(
                                title: Text('Duration: ${entry.duration}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Distance: ${entry.distance}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Average Speed: ${entry.averageSpeed}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Top Speed: ${entry.topSpeed}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
