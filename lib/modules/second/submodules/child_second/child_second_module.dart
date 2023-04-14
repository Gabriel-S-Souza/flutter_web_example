import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/child_second_screen.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/service_child_second.dart';

class ChildSecondModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ServiceChildSecond()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const ChildSecondScreen(title: 'Child Second Screen'),
        ),
      ];
}
