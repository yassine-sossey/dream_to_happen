// **************بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيم***************
// copyright YouShine corp 2024

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/principale_screen.dart';

void main() {
  //runApp(DreamToHappenApp());
  runApp(ChangeNotifierProvider(
    create: (context) => RemainedTasksNumber(),
    child: const MaterialApp(
      home: DreamToHappenApp(),
    ),
  ));
}
