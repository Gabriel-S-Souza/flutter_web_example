import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/models/user_model.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/service_child_second.dart';
import 'package:flutter_web_test/service_global.dart';

import '../../../../nav_fix/hybrid_navigator.dart';
import '../../service_second.dart';

class ChildSecondScreen extends StatefulWidget {
  final String title;
  final String id;
  final UserModel user;

  const ChildSecondScreen({
    super.key,
    required this.title,
    required this.id,
    required this.user,
  });

  @override
  State<ChildSecondScreen> createState() => _ChildSecondScreenState();
}

class _ChildSecondScreenState extends State<ChildSecondScreen> {
  final ServiceGlobal serviceGlobal = Modular.get();
  final ServiceChildSecond serviceChildSecond = Modular.get();
  final ServiceSecond serviceSecond = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Id: ${widget.id}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'User: ${widget.user.name} - ${widget.user.email}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              serviceGlobal.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              serviceChildSecond.message,
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
