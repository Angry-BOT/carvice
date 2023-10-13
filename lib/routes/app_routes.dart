import 'package:flutter/material.dart';
import 'package:carvice/presentation/splash_screen/splash_screen.dart';
import 'package:carvice/presentation/login_screen/login_screen.dart';
import 'package:carvice/presentation/signup_screen/signup_screen.dart';
import 'package:carvice/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        signupScreen: SignupScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
