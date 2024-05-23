import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

class Routes {
  static const String homeRoute = "/";
  static const String contactsRoute = "/contacts";
  static const String blogRoute = "/blog";
  static const String projectsRoute = "/projects";
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.homeRoute,
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: HomeScreen(location: state.uri.path, child: child),
      ),
      routes: [
        GoRoute(
          path: Routes.homeRoute,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(child: AboutScreen()),
        ),
        GoRoute(
          path: Routes.contactsRoute,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(child: ContactsScreen()),
        ),
        GoRoute(
          path: Routes.blogRoute,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(child: BlogScreen()),
        ),
      ],
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: '/login',
    //   pageBuilder: (context, state) {
    //     return NoTransitionPage(
    //       key: UniqueKey(),
    //       child: Scaffold(
    //         appBar: AppBar(),
    //         body: const Center(
    //           child: Text("Login"),
    //         ),
    //       ),
    //     );
    //   },
    // ),
  ],
);
