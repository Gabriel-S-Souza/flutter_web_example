import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/home_screen.dart';

class HomeScreenModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => HomeScreenExampleController('Dependencia injetada no primeiro módulo'),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomeScreen(
            title: 'Home screen \u{1F3E0}',
          ),
        ),
      ];
}

class HomeScreenExampleController {
  final String title;
  HomeScreenExampleController(this.title);
}
