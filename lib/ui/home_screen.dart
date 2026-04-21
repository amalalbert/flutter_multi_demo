import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/home/ui/home_page.dart';
import 'package:rearch_demo/features/home/ui/title_bar.dart';
// Import your previous capsules and models here

class MainHomeScreen extends RearchConsumer {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // Access navigation state
    return Scaffold(body: HomePage(), appBar: const TitleBar(),backgroundColor: Colors.black,);
  }
}