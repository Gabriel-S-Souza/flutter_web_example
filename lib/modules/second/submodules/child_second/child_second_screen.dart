import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/service_child_second.dart';
import 'package:flutter_web_test/service_global.dart';

import '../../../../nav_fix/hybrid_navigator.dart';
import '../../service_second.dart';

class ChildSecondScreen extends StatefulWidget {
  const ChildSecondScreen({super.key, required this.title});

  final String title;

  @override
  State<ChildSecondScreen> createState() => _ChildSecondScreenState();
}

class _ChildSecondScreenState extends State<ChildSecondScreen> {
  final ServiceGlobal serviceGlobal = Modular.get();
  final ServiceChildSecond serviceChildSecond = Modular.get();
  final ServiceSecond serviceSecond = Modular.get();

  @override
  void initState() {
    super.initState();
  }

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
              serviceChildSecond.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              serviceSecond.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => setState(() => serviceChildSecond.increment()),
            heroTag: 'child second increment',
            tooltip: 'Third screen',
            label: const Text('Increment Child Second'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              HybridNavigator.pop();
            },
            heroTag: 'child second back',
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
