import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Setting_button.dart';

import '../Widgets/NavBar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void setDistance() {}
  void vocalFeedback() {}

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
                title: const Text('Settings',
                    style: TextStyle(fontSize: 40, color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 241, 172, 70),
              ),
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Container(
                            height: 400,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Feedback Every :",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(height: 30),
                                SettingButton(
                                    onTap: setDistance, distance: '200m'),
                                const SizedBox(height: 20),
                                SettingButton(
                                    onTap: setDistance, distance: '250m'),
                                const SizedBox(height: 20),
                                SettingButton(
                                    onTap: setDistance, distance: '500m'),
                                const SizedBox(height: 20),
                                SettingButton(
                                    onTap: setDistance, distance: '1km'),
                              ],
                            )),
                        const SizedBox(height: 40),
                        Container(
                            constraints: const BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Voice Feed back :",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                SettingButton(
                                    onTap: vocalFeedback, distance: 'Enable'),
                                const SizedBox(height: 20),
                                SettingButton(
                                    onTap: vocalFeedback, distance: 'Disable'),
                                const SizedBox(height: 20),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
