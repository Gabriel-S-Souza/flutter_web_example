import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/third/service_third.dart';
import 'package:flutter_web_test/modules/third/third_screen.dart';

class ThirdModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ServiceThird()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ThirdScreen(title: 'Third screen')),
  ];
}
