import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/shared/utils.dart';
import 'post_model.dart';

// This capsule defines how to fetch posts
Future<List<Post>> postsFutureCapsule(CapsuleHandle use) async {
  AppLogger.logger.info('Fetching posts from API');
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': 'PostmanRuntime/7.28.4', // Mimics a common testing tool
      },
    );
    AppLogger.logger.info('Response ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      AppLogger.logger.info('Successfully fetched ${data.length} posts');
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      AppLogger.logger.warning(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
      throw Exception('Failed to load posts');
    }
  } catch (e) {
    AppLogger.logger.severe('Error fetching posts: $e');
    rethrow;
  }
}
