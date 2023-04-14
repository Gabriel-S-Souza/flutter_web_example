import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/second_screen.dart';
import 'package:flutter_web_test/modules/second/service_second.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/child_second_module.dart';

class SecondModule extends Module {
  @override
  List<Bind> get binds => [Bind.lazySingleton((i) => ServiceSecond())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const SecondScreen(title: 'Second Screen')),
        ModuleRoute('/child_second', module: ChildSecondModule()),
      ];
}
