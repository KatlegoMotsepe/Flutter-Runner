import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Widgets/NavBar.dart';

// ignore: must_be_immutable
class EndPage extends StatefulWidget {
  EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  static const CameraPosition _belgiumCampus = CameraPosition(
    target: LatLng(-25.685098, 28.130163),
    zoom: 16.5,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.height;
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
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/running-man.png',
                  height: 100,
                  width: 100,
                ),
                const Text("End",
                    style: TextStyle(fontSize: 40, color: Colors.white)),
              ],
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(0, 241, 172, 70),
          ),
          body: SafeArea(
            child: Stack(children: [
              Container(
                height: deviceHeight,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  markers: {
                    // Marker(markerId: )
                  },
                  initialCameraPosition: _belgiumCampus,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Total Distance :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Average Pace :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.green[300],
                                  title: Text(
                                    'Success',
                                    style: TextStyle(color: Colors.white),
                                  ), // Title of the dialog
                                  content: Text('Entry saved',
                                      style: TextStyle(
                                          color: Colors
                                              .white)), // Content of the dialog
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyHomePage(
                                                    title: 'Home',
                                                  )),
                                        ); // Close the dialog
                                      },
                                      child: Text('OK'), // Button text
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Image(
                            height: 100,
                            width: 100,
                            image: AssetImage("assets/save.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
