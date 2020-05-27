import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import 'app.dart';
import 'src/store/counter_module.dart';
import 'src/store/modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final store = Store();
  CounterModule(store);
  ValidationFormModule(store);
  PostModule(store);
  ThemeModule(store);
  StreamModule(store);

  runApp(
    StoreProvider(
      store: store,
      child: App(),
    ),
  );
}
