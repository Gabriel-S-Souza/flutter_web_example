import 'package:flutter_modular/flutter_modular.dart';

import 'nav_fix_base.dart';

/// Work around Modular 5.0.3 history loss issue in Flutter Web.
class HybridNavigator {
  static final INavFix _navFix = Modular.get<INavFix>();

  /// Removes the current route from the route stack.
  ///
  /// On the web, when Modular loses web route history, navigate to previous page recorded in browser history.
  /// On Mobile it only runs Modular.to.pop()
  static void pop() {
    return _navFix.pop();
  }

  /// Updates the URL without changing the current page.
  ///
  /// **Note:** it has no effect outside Flutter Web.
  static void updateUrl(String url) {
    return _navFix.updateUrl(url);
  }
}
