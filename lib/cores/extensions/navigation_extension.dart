import 'package:flutter/material.dart';

extension NavigatorExt on BuildContext {
  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>({result}) => Navigator.pop(this, result);

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) async =>
      await Navigator.of(this).push(
        MaterialPageRoute(
          builder: (_) => screen,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) async =>
      await Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (_) => screen,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool routes = false,
  }) async =>
      await Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => screen,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        (Route<dynamic> route) => routes,
      );

  /// perform push with routeName
  Future<T?> pushNamed<T extends Object?>(
    String screenName, {
    Object? arguments,
  }) async =>
      await Navigator.of(this).pushNamed<T>(screenName, arguments: arguments);

  /// perform replash with routeName
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String screenName, {
    Object? arguments,
  }) async =>
      await Navigator.of(this)
          .pushReplacementNamed<T, TO>(screenName, arguments: arguments);

  /// perform replash with routeName
  void popUntil(String screenName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(screenName));

  /// pop until first root page
  void popUntilFirst() => Navigator.of(this).popUntil(
        (route) => route.isFirst && route.isCurrent,
      );
}
