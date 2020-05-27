import 'package:flutter_super_state/flutter_super_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModule extends StoreModule {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeModule(Store store) : super(store) {
    _getDarkMode();
  }

  void changeDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
      _updateDarkMode();
    });
  }

  void _updateDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _isDarkMode);
  }

  void _getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => _isDarkMode = prefs.getBool('darkMode') ?? false);
  }
}
