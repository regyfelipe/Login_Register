import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const LoginRegister());
}
class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup UI',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.signin, 
      onGenerateRoute: AppRoutes.generateRoute, 
      debugShowCheckedModeBanner: false,
    );
  }
}