import 'package:flutter/widgets.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

extension StoreExtension on BuildContext {
  /// Get module by context. For example:
  /// ```dart
  ///  final counter = context.getModule<CounterModule>();
  ///  ```
  T getModule<T extends StoreModule>() {
    return StoreProvider.store(this).getModule<T>();
  }
}
