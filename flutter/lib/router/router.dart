import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

const String homeRoute = "/";
const String contactsRoute = "/contacts";
const String blogRoute = "/blog";

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: homeRoute,
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: ScaffoldWithNavBar(location: state.uri.path, child: child),
      ),
      routes: [
        GoRoute(
          path: homeRoute,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: contactsRoute,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(child: ContactsScreen()),
        ),
        GoRoute(
          path: blogRoute,
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
