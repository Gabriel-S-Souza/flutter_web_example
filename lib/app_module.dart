import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/home/home_screen_module.dart';
import 'package:flutter_web_test/nav_fix/nav_fix_base.dart';
import 'package:flutter_web_test/service_global.dart';

import 'modules/second/second_screen_module.dart';
import 'modules/third/third_screen_module.dart';

// import './nav_fix/nav_fix_stub.dart'
//     if (dart.library.io) './nav_fix/nav_fix_mobile.dart'
//     if (dart.library.html) './nav_fix/nav_fix_web.dart';

class AppModule extends Module {
  final bool showDebbugBanner;
  AppModule({this.showDebbugBanner = true});

  @override
  List<Bind> binds = [
    Bind.lazySingleton((i) => ServiceGlobal()),
    // Bind.factory<INavFix>((i) => NavFix()),
  ];

  @override
  List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/second', module: SecondModule()),
    ModuleRoute('/third', module: ThirdModule()),
  ];
}
