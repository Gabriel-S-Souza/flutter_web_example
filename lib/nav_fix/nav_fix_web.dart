// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter_modular/flutter_modular.dart';

import 'nav_fix_base.dart';

class NavFix extends INavFix {
  bool get _hasHistory => Modular.to.canPop();

  /// Removes the current route from the route stack.
  ///
  /// When Modular loses web route history, navigate to previous page recorded in browser history.
  @override
  void pop() {
    if (!_hasHistory) {
      window.history.back();
    } else {
      Modular.to.pop();
    }
  }

  /// Updates the URL without changing the current page.
  @override
  void updateUrl(String url) {
    window.history.pushState(null, '', url);
  }
}
