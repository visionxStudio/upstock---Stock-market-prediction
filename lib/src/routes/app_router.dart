import 'package:auto_route/auto_route.dart';
import 'package:upstock/src/features/authentication/login/login.dart';
import 'package:upstock/src/features/authentication/signup/signup_page.dart';
import 'package:upstock/src/features/splash/upstock_splash.dart';
import 'package:upstock/src/features/welcome/welcome_screen.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: UpStockSplash, initial: true),
    AutoRoute(page: WelcomeScreen),
    AutoRoute(page: Login),
    AutoRoute(page: Signup),
  ],
)
class $AppRouter {}
