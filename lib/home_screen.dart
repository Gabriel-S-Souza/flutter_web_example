import 'package:flutter/material.dart';
import 'package:flutter_web_test/service_test.dart';
import 'package:flutter_web_test/setup_locator.dart';
import 'package:flutter_web_test/user_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<HomeScreen> {
  final ServiceTest controller = getIt<ServiceTest>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    idController.text = controller.id.toString();
  }

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.decrement();
                            idController.text = controller.id.toString();
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_left_outlined),
                      ),
                      Expanded(
                        child: TextField(
                          controller: idController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Id',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.increment();
                            idController.text = controller.id.toString();
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              controller.message,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.goNamed(
                'second',
                params: {'id': controller.id.toString()},
                queryParams: {
                  'name': nameController.text,
                  'email': emailController.text,
                },
                extra: UserModel(
                  name: nameController.text,
                  email: emailController.text,
                ),
              );
              // Navigator.of(context).pushNamed(
              //   '/second',
              //   arguments: UserModel(
              //     name: nameController.text,
              //     email: emailController.text,
              //   ),
              // );
            },
            tooltip: 'Second screen',
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
