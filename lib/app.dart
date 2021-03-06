import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import 'src/store/modules.dart' show ThemeModule;
import 'src/screens/login/login_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ModuleBuilder<ThemeModule>(
      builder: (context, module) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Super State Demo',
          theme: module.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: LoginPage(),
        );
      },
    );
  }
}
