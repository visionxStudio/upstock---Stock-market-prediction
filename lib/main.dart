import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/service/shared_pref_provider.dart';

import 'package:upstock/src/routes/app_router.gr.dart';

import 'src/themes/theme_data.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
//     log('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "$newValue"
// }''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefProvider.initialize();
  Firebase.initializeApp();

  runApp(
    const ProviderScope(
      // observers: [Logger()],
      child: MyApp(),
    ),
  );
  //);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: "UPSTOCK",
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
    );
  }
}
