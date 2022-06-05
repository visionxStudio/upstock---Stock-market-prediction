// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../features/authentication/login/login.dart' as _i3;
import '../features/authentication/signup/signup_page.dart' as _i4;
import '../features/navbar/navbar.dart' as _i5;
import '../features/splash/upstock_splash.dart' as _i1;
import '../features/stock_analysis/stock_analysis.dart' as _i6;
import '../features/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    UpStockSplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UpStockSplash());
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Login());
    },
    SignupRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Signup());
    },
    NavBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavBarRouteArgs>(
          orElse: () => const NavBarRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.NavBar(key: args.key, activeNavPage: args.activeNavPage));
    },
    StockAnalysisRoute.name: (routeData) {
      final args = routeData.argsAs<StockAnalysisRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.StockAnalysis(key: args.key, chartData: args.chartData));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(UpStockSplashRoute.name, path: '/'),
        _i7.RouteConfig(WelcomeScreenRoute.name, path: '/welcome-screen'),
        _i7.RouteConfig(LoginRoute.name, path: '/Login'),
        _i7.RouteConfig(SignupRoute.name, path: '/Signup'),
        _i7.RouteConfig(NavBarRoute.name, path: '/nav-bar'),
        _i7.RouteConfig(StockAnalysisRoute.name, path: '/stock-analysis')
      ];
}

/// generated route for
/// [_i1.UpStockSplash]
class UpStockSplashRoute extends _i7.PageRouteInfo<void> {
  const UpStockSplashRoute() : super(UpStockSplashRoute.name, path: '/');

  static const String name = 'UpStockSplashRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeScreenRoute extends _i7.PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(WelcomeScreenRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.Signup]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/Signup');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i5.NavBar]
class NavBarRoute extends _i7.PageRouteInfo<NavBarRouteArgs> {
  NavBarRoute(
      {_i8.Key? key, _i5.NavBarPage activeNavPage = _i5.NavBarPage.home})
      : super(NavBarRoute.name,
            path: '/nav-bar',
            args: NavBarRouteArgs(key: key, activeNavPage: activeNavPage));

  static const String name = 'NavBarRoute';
}

class NavBarRouteArgs {
  const NavBarRouteArgs({this.key, this.activeNavPage = _i5.NavBarPage.home});

  final _i8.Key? key;

  final _i5.NavBarPage activeNavPage;

  @override
  String toString() {
    return 'NavBarRouteArgs{key: $key, activeNavPage: $activeNavPage}';
  }
}

/// generated route for
/// [_i6.StockAnalysis]
class StockAnalysisRoute extends _i7.PageRouteInfo<StockAnalysisRouteArgs> {
  StockAnalysisRoute({_i8.Key? key, required List<_i6.SalesData> chartData})
      : super(StockAnalysisRoute.name,
            path: '/stock-analysis',
            args: StockAnalysisRouteArgs(key: key, chartData: chartData));

  static const String name = 'StockAnalysisRoute';
}

class StockAnalysisRouteArgs {
  const StockAnalysisRouteArgs({this.key, required this.chartData});

  final _i8.Key? key;

  final List<_i6.SalesData> chartData;

  @override
  String toString() {
    return 'StockAnalysisRouteArgs{key: $key, chartData: $chartData}';
  }
}
