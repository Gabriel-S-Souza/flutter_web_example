import 'package:flutter/material.dart';
import 'package:flutter_web_test/home_screen.dart';
import 'package:flutter_web_test/second_screen.dart';
import 'package:flutter_web_test/setup_locator.dart';
import 'package:flutter_web_test/user_model.dart';

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

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const HomeScreen(title: 'Home'),
            );
          case '/second':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => SecondScreen(
                title: 'Second',
                user: settings.arguments as UserModel?,
              ),

            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}