import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_test/modules/second/models/user_model.dart';
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
          '/:id',
          child: (_, args) => ChildSecondScreen(
            title: args.queryParams['title']!,
            id: args.params['id']!,
            user: args.data,
          ),
        ),
      ];
}
