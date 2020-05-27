import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import '../store/modules.dart' show ThemeModule;

class SettingsPage extends StatelessWidget {
  final String title;

  const SettingsPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Theme.of(context).accentColor,
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ModuleBuilder<ThemeModule>(
            builder: (context, module) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Theme', style: textStyle),
                    dense: true,
                  ),
                  SwitchListTile.adaptive(
                    title: Text('Dark mode'),
                    secondary: Icon(Icons.brightness_6),
                    value: module.isDarkMode,
                    onChanged: module.changeDarkMode,
                  ),
                ],
              );
            },
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
