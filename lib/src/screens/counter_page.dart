import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';
import 'package:super_state_demo/src/extensions/super_state_api.dart';

import '../store/modules.dart' show CounterModule, ValidationFormModule;

import 'login/login_page.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ModuleBuilder<CounterModule>(
        builder: (context, module) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              context.getModule<ValidationFormModule>().email.value != null
                  ? Text(
                      'Player: ${context.getModule<ValidationFormModule>().email.value}',
                    )
                  : Text('Player: Offline'),
              const SizedBox(height: 8),
              Text('Press the button to 10 for logoutt'),
              Text(
                '${module.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'IncrementButton',
            onPressed: () {
              // Don't need to rebuild widgets, only setState that applies
              final module = context.getModule<CounterModule>();
              module.increment();
              if (module.counter == 10) {
                _logOut(context);
                module.resetCounter();
              }
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'DecrementButton',
            onPressed: () => context.getModule<CounterModule>().decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

void _logOut(BuildContext context) {
  Navigator.pushReplacement(context, LoginPage.route());
  context.getModule<ValidationFormModule>().reset();
}
