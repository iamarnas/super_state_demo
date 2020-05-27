import 'dart:async';

import 'package:flutter_super_state/flutter_super_state.dart';

class StreamModule extends StoreModule {
  int counter = 0;

  final _controller = StreamController<int>.broadcast();

  StreamModule(Store store) : super(store);

  @override
  Stream get onChange => _controller.stream.asBroadcastStream();

  Timer _timer;

  void count() {
    setState(() {
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (_timer?.isActive ?? false) _controller.sink.add(counter++);
      });
    });
  }

  void stop() {
    setState(() {
      _timer?.cancel();
      _timer = null;
    });
  }

  void reset() {
    setState(() {
      _controller.sink.add(counter = 0);
    });
  }

  void dispose() {
    _controller.close();
  }
}
