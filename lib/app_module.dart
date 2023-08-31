import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/home/home_screen_module.dart';
import 'package:flutter_web_test/service_global.dart';

import 'modules/second/second_screen_module.dart';
import 'modules/third/third_screen_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(ServiceGlobal.new);
  }

  @override
  void routes(RouteManager r) {
    r.add(ModuleRoute(Modular.initialRoute, module: HomeModule()));
    r.add(ModuleRoute('/second', module: SecondModule()));
    r.add(ModuleRoute('/third', module: ThirdModule()));
  }
}
