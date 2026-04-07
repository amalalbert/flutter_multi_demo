import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/posts/data/post_model.dart';
import 'package:rearch_demo/features/posts/data/post_repository.dart';

// This capsule converts the Future into a UI-friendly AsyncValue
AsyncValue<List<Post>> postsStateCapsule(CapsuleHandle use) {
  return use.future(use(postsFutureCapsule));
}