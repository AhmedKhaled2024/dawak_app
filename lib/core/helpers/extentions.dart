import 'package:dawak_24/core/routing/routes.dart';
import 'package:flutter/widgets.dart';

extension Navegation on BuildContext{
  //  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
  //   return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  // }

  //Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
  //  return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
 // }

  // Future<dynamic> pushNamedAndRemoveUntil(String routeName,
  //     {Object? arguments, required RoutePredicate predicate}) {
  //   return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  // }

  void pop() => Navigator.of(this).pop();
///
    Future<dynamic> pushNamed(Routes route, {Object? arguments}) {
    return Navigator.of(this).pushNamed(
      route.toString(),
      arguments: arguments,
    );
  }
///
  Future<dynamic> pushReplacementNamed(Routes route, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(
      route.toString(),
      arguments: arguments,
    );
  }
 ///
  
}