import 'package:flutter/material.dart';
import 'package:flutter_web_test/service_test.dart';
import 'package:flutter_web_test/setup_locator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void dispose() {
    super.dispose();
  }

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
              'Second screen',
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
              Navigator.of(context).pop();
            },
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
