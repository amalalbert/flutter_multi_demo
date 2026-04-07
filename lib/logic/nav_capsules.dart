import 'package:rearch/rearch.dart';

// Capsule to hold the current tab index
(int, void Function(int)) navIndexCapsule(CapsuleHandle use) {
  return use.state(0);
}