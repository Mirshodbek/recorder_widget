import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:render/render.dart';
import 'package:test_app_recorder/menu_screen.dart';

import 'home/home_screen.dart';
import 'order_screen.dart';
import 'table_screen.dart';
import 'video_screen.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      ShellRoute(
        navigatorKey: AppGlobalKeys.shellNavigatorKey,
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: '/',
            parentNavigatorKey: AppGlobalKeys.shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const TableScreen(),
              );
            },
          ),
          GoRoute(
            path: '/menu',
            name: 'menu',
            parentNavigatorKey: AppGlobalKeys.shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: MenuScreen(title: state.extra as String),
              );
            },
          ),
          GoRoute(
            path: '/order',
            name: 'order',
            parentNavigatorKey: AppGlobalKeys.shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const OrderScreen(),
              );
            },
          ),
          GoRoute(
            path: '/video',
            name: 'video',
            parentNavigatorKey: AppGlobalKeys.shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: VideoScreen(
                  renderResult: state.extra as RenderResult?,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}

class AppGlobalKeys {
  static final rootRouterWeb = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
}
