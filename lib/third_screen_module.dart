import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/third_screen.dart';

class ThirdScreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ThirdScreen(title: 'Third screen')),
  ];
}
