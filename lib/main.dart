import 'package:flutter/material.dart';
import 'package:flutter_web_test/home_screen.dart';
import 'package:flutter_web_test/second_screen.dart';
import 'package:flutter_web_test/setup_locator.dart';

void main() {
  setupLocator();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Test',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(
              title: 'Flutter Web Test',
            ),
        '/second': (context) => const SecondScreen(
              title: 'Second Screen',
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
