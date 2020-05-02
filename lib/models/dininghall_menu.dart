import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu.dart';

part 'dininghall_menu.g.dart';

@JsonSerializable()
class DiningHallMenu {
  final int type;
  final String date;
  final String soup;
  final String main_dinner;
  final String third_kind;
  final String fourth_kind;
  final String fifth_kind;

  DiningHallMenu(this.type, this.date, this.soup, this.main_dinner,
      this.third_kind, this.fourth_kind, this.fifth_kind);

  Widget buildTitle(int index) {
    String title = '';
    switch (index) {
      case 0:
        title = 'Çorba';
        break;
      case 1:
        title = 'Ana Yemek';
        break;
      case 2:
        title = '3. Çeşit';
        break;
      case 3:
        title = '4. Çeşit';
        break;
      case 4:
        title = '5. Çeşit';
        break;
    }
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF33495E),
      ),
    );
  }

  Widget buildSubTitle(int index) {
    String subTitle = '';
    switch (index) {
      case 0:
        subTitle = this.soup;
        break;
      case 1:
        subTitle = this.main_dinner;
        break;
      case 2:
        subTitle = this.third_kind;
        break;
      case 3:
        subTitle = this.fourth_kind;
        break;
      case 4:
        subTitle = this.fifth_kind;
        break;
    }
    return Text(
      subTitle,
      style: TextStyle(
        color: Color(0xFF33495E),
      ),
    );
  }

  int getType() {
    return this.type;
  }

  String getDate() {
    return this.date;
  }

  String getSoup() {
    return this.soup;
  }

  String getMainDinner() {
    return this.main_dinner;
  }

  String getThirdKind() {
    return this.third_kind;
  }

  String getFourthKind() {
    return this.fourth_kind;
  }

  String getFifthKind() {
    return this.fifth_kind;
  }

  factory DiningHallMenu.fromJson(Map<String, dynamic> json) =>
      _$DiningHallMenuFromJson(json);
  Map<String, dynamic> toJson() => _$DiningHallMenuToJson(this);
}
