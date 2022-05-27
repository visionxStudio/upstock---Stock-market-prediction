// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/authentication/login/login.dart' as _i3;
import '../features/authentication/signup/signup_page.dart' as _i4;
import '../features/navbar/navbar.dart' as _i5;
import '../features/splash/upstock_splash.dart' as _i1;
import '../features/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    UpStockSplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UpStockSplash());
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Login());
    },
    SignupRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Signup());
    },
    NavBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavBarRouteArgs>(
          orElse: () => const NavBarRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.NavBar(key: args.key, activeNavPage: args.activeNavPage));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(UpStockSplashRoute.name, path: '/'),
        _i6.RouteConfig(WelcomeScreenRoute.name, path: '/welcome-screen'),
        _i6.RouteConfig(LoginRoute.name, path: '/Login'),
        _i6.RouteConfig(SignupRoute.name, path: '/Signup'),
        _i6.RouteConfig(NavBarRoute.name, path: '/nav-bar')
      ];
}

/// generated route for
/// [_i1.UpStockSplash]
class UpStockSplashRoute extends _i6.PageRouteInfo<void> {
  const UpStockSplashRoute() : super(UpStockSplashRoute.name, path: '/');

  static const String name = 'UpStockSplashRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeScreenRoute extends _i6.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(WelcomeScreenRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.Signup]
class SignupRoute extends _i6.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/Signup');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i5.NavBar]
class NavBarRoute extends _i6.PageRouteInfo<NavBarRouteArgs> {
  NavBarRoute(
      {_i7.Key? key, _i5.NavBarPage activeNavPage = _i5.NavBarPage.home})
      : super(NavBarRoute.name,
            path: '/nav-bar',
            args: NavBarRouteArgs(key: key, activeNavPage: activeNavPage));

  static const String name = 'NavBarRoute';
}

class NavBarRouteArgs {
  const NavBarRouteArgs({this.key, this.activeNavPage = _i5.NavBarPage.home});

  final _i7.Key? key;

  final _i5.NavBarPage activeNavPage;

  @override
  String toString() {
    return 'NavBarRouteArgs{key: $key, activeNavPage: $activeNavPage}';
  }
}
