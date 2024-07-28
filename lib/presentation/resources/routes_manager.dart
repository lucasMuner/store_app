import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_advanced_app/presentation/login/login.dart';
import 'package:flutter_advanced_app/presentation/main/main_view.dart';
import 'package:flutter_advanced_app/presentation/onboarding/onboarding.dart';
import 'package:flutter_advanced_app/presentation/register/register.dart';
import 'package:flutter_advanced_app/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_app/presentation/store_details/store_details.dart';

import '../splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetaislRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => MainView());
      case Routes.storeDetaislRoute:
        return MaterialPageRoute(builder: (context) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(AppString.noRouteFound),
        ),
        body: Center(child: Text(AppString.noRouteFound)),
      ),
    );
  }
}
