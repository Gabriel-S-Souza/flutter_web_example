import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/third/service_third.dart';
import 'package:flutter_web_test/modules/third/third_screen.dart';

class ThirdModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(ServiceThird.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const ThirdScreen(title: 'Third screen'));
  }
}
