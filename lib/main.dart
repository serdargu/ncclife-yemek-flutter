import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // 1
import 'package:ncclifeyemek/screens/dininghall_screen.dart';
import 'package:provider/provider.dart';

import 'screens/restaurant_screen.dart';
import 'screens/dininghall_screen.dart';
import 'api/v1.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RestClient>(
      create: (context) => RestClient.create(),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood,
              ),
              title: Text(
                'Restoranlar',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_dining,
              ),
              title: Text(
                'Yemekhane',
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoTabView(builder: (context) {
              return RestaurantScreen();
            });
          } else {
            return CupertinoTabView(builder: (context) {
              return DiningHallScreen();
            });
          }
        },
      ),
    );
  }
}
