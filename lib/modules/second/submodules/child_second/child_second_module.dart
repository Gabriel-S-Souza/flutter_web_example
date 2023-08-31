import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/child_second_screen.dart';
import 'package:flutter_web_test/modules/second/submodules/child_second/service_child_second.dart';

class ChildSecondModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(ServiceChildSecond.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/:id',
      child: (context) => ChildSecondScreen(
        title: r.args.queryParams['title']!,
        id: r.args.params['id']!,
        user: r.args.data,
      ),
    );
  }
}
