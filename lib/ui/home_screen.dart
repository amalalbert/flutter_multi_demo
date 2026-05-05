import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/home/ui/home_page.dart';
import 'package:rearch_demo/features/home/ui/title_bar.dart';

class MainHomeScreen extends RearchConsumer {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    return Scaffold(
      appBar: const TitleBar(),
      body: HomePage(),
      backgroundColor: Colors.black,
    );
  }
}