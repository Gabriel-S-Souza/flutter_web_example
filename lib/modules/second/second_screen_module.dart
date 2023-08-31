import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/second_screen.dart';
import 'package:flutter_web_test/modules/second/service_second.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/child_second_module.dart';

class SecondModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(ServiceSecond.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (context) => const SecondScreen(title: 'Second Screen'),
    );
    r.add(ModuleRoute('/child_second', module: ChildSecondModule()));
  }
}
