import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/home/home_screen.dart';
import 'package:flutter_web_test/modules/home/service_home.dart';
import 'package:flutter_web_test/service_global.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(ServiceGlobal.new);
    i.addLazySingleton(ServiceHome.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      Modular.initialRoute,
      child: (context) => const HomeScreen(title: 'Home screen \u{1F3E0}'),
    );
  }
}
