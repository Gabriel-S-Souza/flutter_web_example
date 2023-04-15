import 'package:flutter/material.dart';
import 'package:flutter_web_test/home_screen.dart';
import 'package:flutter_web_test/second_screen.dart';
import 'package:flutter_web_test/setup_locator.dart';
import 'package:flutter_web_test/user_model.dart';
import 'package:go_router/go_router.dart';

void main() {
  setupLocator();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Web Test',
      routerConfig: _router,

      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case '/':
      //       return MaterialPageRoute(
      //         settings: settings,
      //         builder: (context) => const HomeScreen(title: 'Home'),
      //       );
      //     case '/second':
      //       return MaterialPageRoute(
      //         settings: settings,
      //         builder: (context) => SecondScreen(
      //           title: 'Second',
      //           user: settings.arguments as UserModel,
      //         ),

      //       );
      //     default:
      //       return null;
      //   }
      // },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const HomeScreen(title: 'Home'),
    ),
    GoRoute(
      path: '/second/:id',
      name: 'second',
      builder: (context, state) => SecondScreen(
        title: 'Second',
        user: state.extra as UserModel,
      ),
    ),
  ],
);
