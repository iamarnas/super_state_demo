import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import '../store/modules.dart' show StreamModule;

class StreamPage extends StatelessWidget {
  final String title;

  const StreamPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ModuleBuilder<StreamModule>(
        builder: (context, module) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${module.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => module.count(),
                      child: Text('START', style: TextStyle(fontSize: 18)),
                    ),
                    FlatButton(
                      onPressed: () => module.stop(),
                      child: Text('STOP', style: TextStyle(fontSize: 18)),
                    ),
                    FlatButton(
                      onPressed: () => module.reset(),
                      child: Text('RESET', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
