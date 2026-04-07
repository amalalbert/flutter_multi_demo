import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

extension AsyncValueX<T> on AsyncValue<T> {
  Widget when({
    required Widget Function(T data) data,
    required Widget Function() loading,
    required Widget Function(Object error) error,
  }) {
    return switch (this) {
      AsyncData(data: final d) => data(d),
      AsyncLoading() => loading(),
      AsyncError(error: final e) => error(e),
    };
  }
}