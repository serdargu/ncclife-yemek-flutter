import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  final String name;
  final String desc;
  final String price;
  Food(this.name, this.desc, this.price);

  Widget buildListTile() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.3),
        ),
      ),
      child: this.desc == ""
          ? ListTile(
              title: Text(
                this.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33495E),
                ),
              ),
              trailing: Text(
                '₺ ' + this.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33495E),
                ),
              ),
            )
          : ListTile(
              title: Text(
                this.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33495E),
                ),
              ),
              subtitle: Text(
                this.desc,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF33495E),
                ),
              ),
              trailing: Text(
                '₺ ' + this.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF33495E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }

  String getName() {
    return this.name;
  }

  String getDesc() {
    return this.desc;
  }

  String getPrice() {
    return this.price;
  }

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
