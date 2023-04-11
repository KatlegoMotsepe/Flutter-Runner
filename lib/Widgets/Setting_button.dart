// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final Function()? onTap;
  final String distance;
  const SettingButton({super.key, required this.onTap, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange[300]),
          ),
          child: Text(distance, style: const TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
