import 'package:egorozh_cv/features/blog/presentation/pages/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

class Routes {
  static const String homeRoute = "/";
  static const String contactsRoute = "/contacts";
  static const String blogRoute = "/blog";
  static const String articleRoute = "/article";
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
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.articleRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ArticleScreen());
      },
    ),
  ],
);
