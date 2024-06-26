import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio/radio_provider.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RadioProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: MainScreen(),
      ),
    );
  }
}
