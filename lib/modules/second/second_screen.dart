import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/service_second.dart';
import 'package:flutter_web_test/service_global.dart';

import '../../nav_fix/hybrid_navigator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ServiceGlobal serviceGlobal = Modular.get();
  final ServiceSecond serviceSecond = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
              serviceSecond.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/second/child_second'),
              child: const Text('Go to Child Second Module'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => setState(() => serviceGlobal.increment()),
            heroTag: 'second increment global',
            label: const Text('Increment Global'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () => setState(() => serviceSecond.increment()),
            heroTag: 'second increment second',
            label: const Text('Increment Second'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed('/third');
            },
            heroTag: 'second go to third',
            tooltip: 'Third screen',
            child: const Icon(Icons.arrow_forward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Modular.to.canPop()
                  ? Modular.to.pop()
                  : Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
            },
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
