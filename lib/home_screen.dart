import 'package:flutter/material.dart';
import 'package:flutter_web_test/service_test.dart';
import 'package:flutter_web_test/setup_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<HomeScreen> {
  final ServiceTest controller = getIt<ServiceTest>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home screen',
            ),
            const SizedBox(height: 10),
            Text(
              controller.message,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
            tooltip: 'Second screen',
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
