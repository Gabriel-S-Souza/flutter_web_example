abstract class INavFix {
  /// Removes the current route from the route stack.
  ///
  /// When Modular loses web route history, navigate to previous page recorded in browser history.
  /// On Mobile it only runs Modular.to.pop()
  void pop();

  /// Updates the URL without changing the current page.
  ///
  /// **Note:** it has no effect outside flutter web.
  void updateUrl(String url);
}
