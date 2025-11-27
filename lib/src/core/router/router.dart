import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/router/unauth_shell.dart';
import 'package:flutter_base/src/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_base/src/features/login/presentation/screens/login_screen.dart';
import 'package:flutter_base/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_base/src/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../features/splash/domain/entities/splash.dart';
import '../utils/injections.dart';
import 'auth_shell.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

mixin PageRouter {
  GoRouter buildRouter(
    AuthBloc authBloc,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return GoRouter(
      initialLocation: SplashScreen.routePath,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        final loggingIn = state.matchedLocation.startsWith('/unauth');
        final atSplash = state.matchedLocation == SplashScreen.routePath;
        switch (authState) {
          case AuthenticatedState():
            if (atSplash || loggingIn) {
              return HomeScreen.routePath;
            }
            return null;
          case UnauthenticatedState():
            if (!loggingIn) {
              return LoginScreen.routePath;
            }
            return null;
          case UnknownAuthState():
            if (!atSplash) return SplashScreen.routePath;
            return null;
          default:
            return null;
        }
      },
      routes: [
        GoRoute(
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen(),
        ),

        // -------- Unauth Shell --------
        ShellRoute(
          builder: (context, state, child) => UnauthShell(child: child),
          routes: [
            GoRoute(
              path: LoginScreen.routePath,
              builder: (context, state) => const LoginScreen(),
            ),
          ],
        ),

        // -------- Auth Shell --------
        ShellRoute(
          builder: (context, state, child) => AuthShell(child: child),
          routes: [
            GoRoute(
              path: HomeScreen.routePath,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: ProfileScreen.routePath,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
