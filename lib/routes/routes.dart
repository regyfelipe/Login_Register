import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';

class AppRoutes {
  static const String signin = '/signin';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signin:
        return _createCustomRoute(const SigninScreen());
      case signup:
        return _createCustomRoute(const SignupScreen());
      default:
        return _createCustomRoute(const SignupScreen());
    }
  }



// Animação de transição de tela 
  static Route<dynamic> _createCustomRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        const curve = Curves.easeInOut;

        var opacityTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(opacityTween);

        var scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));
        var scaleAnimation = animation.drive(scaleTween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400), 
    );
  }
}
