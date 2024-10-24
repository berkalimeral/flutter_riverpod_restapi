import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/character/view/character_view.dart';
import '../../features/navigation_menu/navigation_menu.dart';
import 'route_names.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final class RouteConfig {
  const RouteConfig._();
  static final router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: RouteNames.root,
    routes: [
      GoRoute(
        path: RouteNames.root,
        builder: (context, state) => const CharacterScreen(),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, child, state) => NavigationMenu(
                navigationShell: state,
              ),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteNames.characterScreen,
                builder: (context, state) => const CharacterScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteNames.locationScreen,
                builder: (context, state) => const CharacterScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteNames.episodeScreen,
                builder: (context, state) => const CharacterScreen(),
              ),
            ]),
          ]),
    ],
  );
}
