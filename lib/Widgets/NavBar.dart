import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/active.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';

import '../pages/history.dart';
import '../pages/settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    'example@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/running-man.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text('History'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryPage()),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.accessibility),
                  title: const Text('Active'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivePage()),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_rounded),
                  title: const Text('Home'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                              title: "Home",
                            )),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Log Out'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage(
                              
                            )),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 80,
              child: Text(
                "Running is a Lifestyle",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
