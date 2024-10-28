import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/character/view/character_view.dart';
import '../../features/character_detail/view/character_detail_view.dart';
import '../../features/episode/view/episode_view.dart';
import '../../features/favorites/view/favorite_view.dart';
import '../../features/navigation_menu/navigation_menu.dart';
import '../../product/models/character/character_model.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _tabANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'tabANav');

final class RouteConfig {
  const RouteConfig._();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.root,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, child, state) => NavigationMenu(
          navigationShell: state,
        ),
        branches: [
          // Tab A - Character Screen
          StatefulShellBranch(
            navigatorKey: _tabANavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.root,
                builder: (context, state) => const CharacterScreen(),
                routes: [
                  // Character detail route opens on the root navigator (without BottomNavigationBar)
                  GoRoute(
                    parentNavigatorKey:
                        _rootNavigatorKey, // Important: Open in the root navigator
                    path: RouteNames.characterDetailScreen,
                    builder: (context, state) => CharacterDetailView(
                      character: state.extra as Character,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Tab B - Location Screen
          StatefulShellBranch(routes: [
            GoRoute(
              path: RouteNames.locationScreen,
              builder: (context, state) => const CharacterScreen(),
            ),
          ]),

          // Tab C - Episode Screen
          StatefulShellBranch(routes: [
            GoRoute(
              path: RouteNames.episodeScreen,
              builder: (context, state) => const EpisodeScreen(),
            ),
          ]),

          // Tab D - Favorite Screen
          StatefulShellBranch(routes: [
            GoRoute(
              path: RouteNames.favoriteScreen,
              builder: (context, state) => const FavoriteScreen(),
            ),
          ]),
        ],
      ),
    ],
  );
}
