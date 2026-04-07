import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/posts/logic/post_capsules.dart';
import 'package:rearch_demo/shared/extentions.dart';

class PostScreen extends RearchConsumer {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final postsAsync = use(postsStateCapsule);

    return Scaffold(
      appBar: AppBar(title: const Text('ReArch API Fetch')),
      body: postsAsync.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(posts[index].title),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err) => Center(child: Text('Error: $err')),
      ),
    );
  }
}