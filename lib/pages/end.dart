import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../Widgets/NavBar.dart';
import 'package:location/location.dart';

// ignore: must_be_immutable
class EndPage extends StatefulWidget {
  EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  final Location location = Location();
  final Set<Polyline> polyline = {};
  List<LatLng> route = [];

  late GoogleMapController _mapController;

  double _dist = 0;
  late String _displayTime;
  late int _time;
  late int _lastTime;
  double _speed = 0;
  double _avgSpeed = 0;
  int _speedCounter = 0;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    double appendDist;

    location.onLocationChanged.listen((event) {
      LatLng loc = LatLng(event.latitude as double, event.longitude as double);
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: loc, zoom: 16.5)));

      if (route.length > 0) {
        appendDist = Geolocator.distanceBetween(route.last.latitude,
            route.last.longitude, loc.latitude, loc.longitude);
        _dist = _dist + appendDist;
        int timeDuration = (_time - _lastTime);

        if (timeDuration != 0) {
          _speed = (appendDist / (timeDuration / 100)) * 3.6;
          if (_speed != 0) {
            _avgSpeed = _avgSpeed + _speed;
            _speedCounter++;
          }
        }
      }
      _lastTime = _time;
      route.add(loc);

      polyline.add(Polyline(
          polylineId: PolylineId(event.toString()),
          visible: true,
          points: route,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          color: Colors.deepOrange));

      setState(() {});
    });
  }

  static const CameraPosition somewhere = CameraPosition(
    target: LatLng(0, 0),
    zoom: 16.5,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

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
                  polylines: polyline,
                  zoomControlsEnabled: false,
                  initialCameraPosition: somewhere,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
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
                            Text((_dist / 1000).toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                          ],
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
