import 'package:flutter_modular/flutter_modular.dart';

import 'nav_fix_base.dart';

class NavFix extends INavFix {
  @override
  void pop() {
    Modular.to.pop();
  }

  @override
  void updateUrl(String url) {}
}
