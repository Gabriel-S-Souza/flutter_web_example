import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/third/service_third.dart';
import 'package:flutter_web_test/nav_fix/hybrid_navigator.dart';
import 'package:flutter_web_test/service_global.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title});

  final String title;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ServiceGlobal serviceGlobal = Modular.get();
  final ServiceThird serviceThird = Modular.get();
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
            const SizedBox(height: 10),
            Text(
              serviceGlobal.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              serviceThird.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => setState(() => serviceGlobal.increment()),
            heroTag: 'third increment global',
            label: const Text('Increment Global'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () => setState(() => serviceThird.increment()),
            heroTag: 'third increment third',
            label: const Text('Increment Third'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              HybridNavigator.pop();
            },
            heroTag: 'third back home',
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
