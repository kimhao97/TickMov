import 'package:flutter/material.dart';
import 'package:move_ticketing/pages/frame/frame_page.dart';
import 'package:move_ticketing/pages/home/home_page.dart';
import 'package:move_ticketing/pages/ticket/TicketPage.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static final AppRoute _shared = AppRoute._private();

  factory AppRoute() {
    return _shared;
  }

  AppRoute._private();

  ///#region ROUTE NAMES
  /// -----------------
  static const String routeHome = '/home';
  static const String routeFrame = '/frame';
  static const String routeTicket = '/Ticket';
  ///#endregion

  /// App route observer
  final RouteObserver<Route<dynamic>> routeObserver = RouteObserver<Route<dynamic>>();

  /// App global navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get app context
  BuildContext? get appContext => navigatorKey.currentContext;

  /// Generate route for app here
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case routeHome:
        return MaterialPageRoute<dynamic>(
            settings: settings,
            builder: (_) => HomePage()
        );
      case routeFrame:
        return MaterialPageRoute<dynamic>(
            settings: settings,
            builder: (_) => FramePage()
        );
      case routeTicket:
        return MaterialPageRoute<dynamic>(
            settings: settings,
            builder: (_) => TicketPage()
        );
      default:
        return null;
    }
  }
}

extension AppRouteExtension on BuildContext {
  AppRoute route() {
    return Provider.of<AppRoute>(this, listen: false);
  }

  NavigatorState? navigator() {
    return route().navigatorKey.currentState;
  }
}