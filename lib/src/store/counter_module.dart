import 'package:flutter_super_state/flutter_super_state.dart';

class CounterModule extends StoreModule {
  int get counter => _counter;
  int _counter = 0;

  CounterModule(Store store) : super(store);

  void increment() => setState(() => _counter++);

  void decrement() => setState(() => _counter--);

  void resetCounter() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() => _counter = 0);
  }
}
