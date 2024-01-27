import 'package:flutter/material.dart';

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;

  MyFadeRoute({required this.page})
      : super(
          // Set the transition duration to 500ms
          transitionDuration: const Duration(milliseconds: 450),
          // Create the fade transition
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          // Return the new page
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
        );
}
