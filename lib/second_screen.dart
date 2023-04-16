import 'package:flutter/material.dart';
import 'package:flutter_web_test/service_test.dart';
import 'package:flutter_web_test/setup_locator.dart';
import 'package:flutter_web_test/user_model.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final UserModel? user;

  const SecondScreen({
    super.key,
    required this.title,
     this.user,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            Text(
              'Can Pop: ${context.canPop()}', 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'User: ${widget.user?.name.toString()}', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Text(
              'Email: ${widget.user?.email.toString()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'ID: ${controller.id}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.go('/');
            },
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
