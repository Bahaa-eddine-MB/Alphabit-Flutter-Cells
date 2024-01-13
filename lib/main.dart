import 'package:first_session/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Second session',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!),
          useMaterial3: true,
        ),
        home: const  MyPage()
        );
  }
}
