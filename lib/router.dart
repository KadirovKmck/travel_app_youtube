import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app_youtube/features/home/presentation/views/details_view.dart';
import 'package:travel_app_youtube/features/home/presentation/views/home_main.dart';

import 'package:travel_app_youtube/features/notification/notification_view.dart';

import 'package:travel_app_youtube/features/home/presentation/views/view.dart';

import 'package:travel_app_youtube/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:travel_app_youtube/features/splash/presentation/views/splash_view.dart';
import 'package:travel_app_youtube/nav_bar.dart';

class RouterConst {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String onboarding = 'onboarding';

  static const String notification = 'notification';

  static const String navbar = 'navbar';
  static const String details = 'details';
  static const String view = 'view';

}

class RouterConf {
  static final GoRouter goRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: RouterConst.splash,
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: RouterConst.home,
        path: '/home',
        builder: (context, state) => const HomeMain(),
      ),
      GoRoute(
        name: RouterConst.onboarding,
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(

        name: RouterConst.notification,
        path: '/notification',
        builder: (context, state) => NotificationView(),)
      GoRoute(
        name: RouterConst.navbar,
        path: '/navbar',
        builder: (context, state) => const NavBarView(),
      ),
      GoRoute(
        name: RouterConst.details,
        path: '/details',
        builder: (context, state) => const DetailsView(),
      ),
      GoRoute(
        name: RouterConst.view,
        path: '/view',
        builder: (context, state) => const View(),

      ),
    ],
  );
}
