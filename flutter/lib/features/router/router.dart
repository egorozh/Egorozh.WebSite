import 'package:go_router/go_router.dart';

import '../features.dart';

const String contactsRoute = "/contacts";

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: contactsRoute,
      builder: (context, state) => const ContactsScreen(),
    ),
  ],
);
