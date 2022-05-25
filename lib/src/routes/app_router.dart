import 'package:auto_route/auto_route.dart';
import 'package:upstock/src/features/authentication/login/login.dart';
import 'package:upstock/src/features/authentication/mobile_page/mobile_page.dart';
import 'package:upstock/src/features/authentication/otp_verification/otp_page.dart';
import 'package:upstock/src/features/authentication/signup/signup_page.dart';
import 'package:upstock/src/features/splash/upstock_splash.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: UpStockSplash, initial: true),
    AutoRoute(page: Login, initial: false),
    AutoRoute(page: MobileNumberPage),
    AutoRoute(page: OtpPage),
    AutoRoute(page: SignupPage),
  ],
)
class $AppRouter {}
