import 'package:flutter_mvvm/routes/routes_name.dart';
import 'package:flutter_mvvm/view/login/login_view.dart';
import 'package:flutter_mvvm/view/splasha_screen.dart';
import 'package:get/get.dart';

import '../view/home/home_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.loginView,
            page: () => LoginView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.homeView,
            page: () => HomeView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
