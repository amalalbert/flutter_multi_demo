import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/shared/utils.dart';
import 'package:rearch_demo/ui/app_router.dart';
import 'package:rearch_demo/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.init();
  runApp(RearchBootstrapper(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Funai Soken video portal',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'NotoSansJP',decoration: TextDecoration.none),
          titleLarge: TextStyle(fontFamily: 'NotoSansJP',decoration: TextDecoration.none,)
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}