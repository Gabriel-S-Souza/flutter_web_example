import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/home/home_screen.dart';
import 'package:flutter_web_test/modules/home/service_home.dart';
import 'package:flutter_web_test/service_global.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ServiceGlobal()),
        Bind.lazySingleton((i) => ServiceHome()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomeScreen(title: 'Home screen \u{1F3E0}'),
        ),
      ];
}
