import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../models/menu.dart';
import '../models/restaurant.dart';
import '../models/food.dart';

class RestaurantMenu extends StatelessWidget {
  final String title;
  final Restaurant restaurant;
  RestaurantMenu({Key key, @required this.title, @required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> items = this.restaurant.getMenus();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF3AAD98),
        actionsForegroundColor: Colors.white,
        trailing: GestureDetector(
          onTap: () async {
            return showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  message: Text('Lütfen aramak istediğiniz numarayı seçin.'),
                  actions: this.restaurant.getActions(),
                  cancelButton: CupertinoActionSheetAction(
                    isDefaultAction: true,
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ),
      child: Scaffold(
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return new StickyHeaderBuilder(
                builder: (BuildContext context, double stuckAmount) {
                  stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                  return new Container(
                    height: 50.0,
                    color: Color.lerp(
                      Color(0xE633495E),
                      Color(0xFF33495E),
                      stuckAmount,
                    ),
                    padding: new EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(
                            items[index].getName(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                content: new Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getFoods(
                      items[index].getFoods(),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  List<Widget> getFoods(List<Food> foods) {
    var listWidget = List<Widget>();
    foods.forEach((food) {
      listWidget.add(
        food.buildListTile(),
      );
    });
    return listWidget;
  }
}
