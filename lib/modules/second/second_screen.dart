import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/models/user_model.dart';
import 'package:flutter_web_test/modules/second/service_second.dart';
import 'package:flutter_web_test/service_global.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ServiceGlobal serviceGlobal = Modular.get();
  final ServiceSecond serviceSecond = Modular.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    idController.text = serviceSecond.count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _decrementId,
                          icon: const Icon(Icons.arrow_left),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: idController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Id',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        IconButton(
                          onPressed: _incrementId,
                          icon: const Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                serviceGlobal.message,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed(
                  '/second/child_second/${serviceSecond.count}?title=Child Second',
                  arguments: UserModel(
                    name: nameController.text,
                    email: emailController.text,
                  ),
                ),
                child: const Text('Go to Child Second Module'),
              ),
            ],
          ),
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
              Modular.to.canPop() ? Modular.to.pop() : Modular.to.navigate('/');
            },
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }

  void _incrementId() {
    setState(() {
      serviceSecond.increment();
      idController.text = serviceSecond.count.toString();
    });
  }

  void _decrementId() {
    setState(() {
      serviceSecond.decrement();
      idController.text = serviceSecond.count.toString();
    });
  }
}
