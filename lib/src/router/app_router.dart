import 'package:fl_auth/src/core/presentations/home/home_page.dart';
import 'package:fl_auth/src/core/presentations/presentations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum Routes { signin, signup, home, test }

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routerNeglect: true,
    debugLogDiagnostics: true,
    initialLocation: '/signin',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: Routes.signin.name,
        path: '/signin',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: Routes.signup.name,
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: Routes.home.name,
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   name: Routes.test.name,
      //   path: '/test',
      //   builder: (context, state) => const TestScreen(),
      // ),
    ],
  );
});
