import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({ required WidgetBuilder builder, required RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // if (settings.isInitialRoute)
    //   return child;

    // Fades between routes. (If you don't want any animation,
    // just return child.)
    // return new FadeTransition(opacity: animation, child: child);
    return child;
  }
}

Future newScreen(
    {required Function newScreen, required BuildContext context}) async {
  await Navigator.push(
    context,
    // MaterialPageRoute(builder: (context) => newScreen()),
    CustomRoute(builder:  (context) => newScreen(), settings: RouteSettings())
  );
}
