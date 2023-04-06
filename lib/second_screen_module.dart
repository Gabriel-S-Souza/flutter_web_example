import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/second_screen.dart';

class SecondScreenModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const SecondScreen(
            title: "2",
          ),
        ),
      ];
}
