// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/card.dart';
import 'package:flutter_application_1/model/entry.dart';

import '../Widgets/NavBar.dart';
import '../db/db.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  // const HistoryPage({required Key key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  late List<Entry> _data;
  List<EntryCard> _cards = [];

  @override
  void initState() {
    super.initState();
    DB.init().then((value) => _fetchEntries());
  }

  void _fetchEntries() async {
    _cards = [];
    List<Map<String, dynamic>> results = await DB.query(Entry.table);
    _data = results.map((item) => Entry.fromMap(item)).toList();
    for (var element in _data) {
      _cards.add(EntryCard(entry: element));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("History",
            style: TextStyle(fontSize: 40, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 172, 70),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Container(
            color: const Color.fromARGB(255, 241, 172, 70),
            child: Column(
              children: [
                ListView(
                  children: _cards,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
