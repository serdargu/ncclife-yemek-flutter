import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'food.dart';
part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final String name;
  final List<Food> foods;
  Menu(this.name, this.foods);
  Widget buildTitle(BuildContext context) => Text(name);
  Widget buildSubtitle(BuildContext context) => Text(name);

  String getName() {
    return this.name;
  }

  List<Food> getFoods() {
    return this.foods;
  }

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
