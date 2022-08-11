import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_mvvm_architecture/presentation/login/login.dart';
import 'package:flutter_mvvm_architecture/presentation/main/main_view.dart';
import 'package:flutter_mvvm_architecture/presentation/onboarding/onboarding.dart';
import 'package:flutter_mvvm_architecture/presentation/register/register.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm_architecture/presentation/splash/splash.dart';
import 'package:flutter_mvvm_architecture/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefainedRoute();
    }
  }

  static Route<dynamic> unDefainedRoute() {
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    ));
  }

  // If we want to page transition with amination 
      // onGenerateRoute: (settings) {
      // if (settings.name == "/someRoute") {
      //   return PageRouteBuilder(
      //     settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
      //     pageBuilder: (_, __, ___) => SomePage(),
      //     transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
      //   );
      // }
      // // Unknown route
      // return MaterialPageRoute(builder: (_) => UnknownPage());
      // },

}
