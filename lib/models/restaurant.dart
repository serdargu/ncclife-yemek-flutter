import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  final int id;
  final String name;
  final String desc;
  final List<String> phones;
  final List<Menu> menus;
  Restaurant(this.id, this.name, this.desc, this.phones, this.menus);
  Widget buildTitle(BuildContext context) => Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF33495E),
        ),
      );
  Widget buildSubtitle(BuildContext context) => Text(
        desc,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Color(0xFF33495E),
        ),
      );

  List<Widget> getActions() {
    List<Widget> actions = [];
    for (final phone in this.phones) {
      actions.add(
        CupertinoActionSheetAction(
          child: Text(phone),
          onPressed: () => launch("tel://" + phone),
        ),
      );
    }
    return actions;
  }

  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getDesc() {
    return this.desc;
  }

  List<String> getPhones() {
    return this.phones;
  }

  List<Menu> getMenus() {
    return this.menus;
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
