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
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: Text(
                    '${module.counter}',
                    key: ValueKey<int>(module.counter),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                                module.paused ? Icons.play_arrow : Icons.pause),
                            onPressed: () => module.pause()),
                        IconButton(
                            icon: Icon(Icons.stop),
                            onPressed: () => module.reset()),
                      ],
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
