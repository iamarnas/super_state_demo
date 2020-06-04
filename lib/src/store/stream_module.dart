import 'dart:async';

import 'package:flutter_super_state/flutter_super_state.dart';

class StreamModule extends StoreModule {
  int _counter = 0;
  int get counter => _counter;
  bool _paused = true;
  bool get paused => _paused;

  StreamModule(Store store) : super(store);

  final _stream = Stream.periodic(Duration(milliseconds: 1000), (i) => i)
      .asBroadcastStream();

  @override
  Stream get onChange => _stream.map((_) {
        if (!_paused) return _counter++;
        return null;
      });

  void pause() {
    setState(() => _paused = !_paused);
  }

  void reset() {
    setState(() {
      _counter = 0;
      _paused = true;
    });
  }
}
