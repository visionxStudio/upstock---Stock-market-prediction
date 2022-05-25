// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/authentication/login/login.dart' as _i3;
import '../features/authentication/signup/signup_page.dart' as _i4;
import '../features/splash/upstock_splash.dart' as _i1;
import '../features/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    UpStockSplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UpStockSplash());
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Login());
    },
    SignupPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignupPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(UpStockSplashRoute.name, path: '/'),
        _i5.RouteConfig(WelcomeScreenRoute.name, path: '/welcome-screen'),
        _i5.RouteConfig(LoginRoute.name, path: '/Login'),
        _i5.RouteConfig(SignupPageRoute.name, path: '/signup-page')
      ];
}

/// generated route for
/// [_i1.UpStockSplash]
class UpStockSplashRoute extends _i5.PageRouteInfo<void> {
  const UpStockSplashRoute() : super(UpStockSplashRoute.name, path: '/');

  static const String name = 'UpStockSplashRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeScreenRoute extends _i5.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(WelcomeScreenRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SignupPage]
class SignupPageRoute extends _i5.PageRouteInfo<void> {
  const SignupPageRoute() : super(SignupPageRoute.name, path: '/signup-page');

  static const String name = 'SignupPageRoute';
}
