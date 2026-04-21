import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/posts/ui/post_screen.dart';
import 'package:rearch_demo/shared/utils.dart';
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
    return MaterialApp(
      title: 'ReArch API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // Point to your feature's entry widget
      home: const MainHomeScreen(),
    );
  }
}
