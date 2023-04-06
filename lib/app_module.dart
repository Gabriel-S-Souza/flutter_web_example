import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/home_screen_module.dart';
import 'package:flutter_web_test/second_screen_module.dart';
import 'package:flutter_web_test/service_test.dart';
import 'package:flutter_web_test/third_screen_module.dart';

class AppModule extends Module {
  final bool showDebbugBanner;
  AppModule({this.showDebbugBanner = true});

  @override
  List<Bind> binds = [
    Bind.lazySingleton((i) => ServiceTest()),
  ];

  @override
  List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeScreenModule()),
    ModuleRoute('/second', module: SecondScreenModule()),
    ModuleRoute('/third', module: ThirdScreenModule()),
  ];
}
