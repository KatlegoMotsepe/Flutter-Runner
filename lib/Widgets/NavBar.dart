import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/active.dart';
import 'package:flutter_application_1/pages/home.dart';

import '../pages/history.dart';
import '../pages/settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
              radius: 30,
              backgroundImage: AssetImage('assets/running-man.png'),
              backgroundColor: Colors.transparent,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/download1.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
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
        ],
      ),
    );
  }
}
