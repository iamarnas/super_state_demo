import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:super_state_demo/src/screens/settings_page.dart';
import 'package:super_state_demo/src/screens/stream_page.dart';

import 'counter_page.dart';
import 'posts_page.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, _) => HomePage(),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final _pages = List<Widget>.unmodifiable([
    CounterPage(title: 'Counter Demo'),
    PostsPage(title: 'Http Request Demo'),
    StreamPage(title: 'Stream Demo'),
    SettingsPage(title: 'Settings'),
  ]);

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation primaryAnimation,
          Animation secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pages.elementAt(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Posts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('Stream'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (index) => setState(() => _pageIndex = index),
      ),
    );
  }
}
