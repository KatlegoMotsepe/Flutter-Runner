import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/model/entry.dart';

class EntryCard extends StatelessWidget {
  final Entry entry;
  const EntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ListTile(
            title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.duration.toString(),
                    style: GoogleFonts.montserrat(fontSize: 18)),
                Text("${entry.distance! / 1000}km",
                    style: GoogleFonts.montserrat(fontSize: 18)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.pace.toString(),
                    style: GoogleFonts.montserrat(fontSize: 14)),
                Text("${entry.avespeed}km/h",
                    style: GoogleFonts.montserrat(fontSize: 14)),
                Text("${entry.topspeed?.toStringAsFixed(2)} km/h",
                    style: GoogleFonts.montserrat(fontSize: 14)),
              ],
            )
          ],
        )),
      ),
    );
  }
}
