import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // 1
import 'package:flutter/widgets.dart';
import 'package:ncclifeyemek/models/dininghall_response.dart';
import 'package:provider/provider.dart';
import '../models/dininghall_menu.dart';
import '../api/v1.dart';

class DiningHallScreen extends StatefulWidget {
  @override
  DiningHall createState() {
    return new DiningHall();
  }
}

class DiningHall extends State<DiningHallScreen> {
  int selectedType = 0;
  String selectedDate = "27.03.2020";

  List<DiningHallMenu> menus;
  DiningHallResponse response;
  DiningHallMenu menu;

  DiningHallMenu getMenu() {
    menu = menus.firstWhere(
        (menu) =>
            menu.getType() == selectedType && menu.getDate() == selectedDate,
        orElse: () => null);
    return menu;
  }

  @override
  void initState() {
    var now = new DateTime.now();
    var _split = now.toString().split(' ')[0].split('-');
    selectedDate = new List.from(_split.reversed).join('.');
    print(selectedDate);
    if (now.hour < 14) {
      selectedType = 0;
    } else {
      selectedType = 1;
    }

    final api = Provider.of<RestClient>(context, listen: false);
    api.getDiningHallResponse().then((it) {
      setState(() {
        response = it;
        this.menus = response.getMenus();
        this.menu = getMenu();
      });
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Yemekhane",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF3AAD98),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (DateTime newdate) {
                    var _split = newdate.toString().split(' ')[0].split('-');
                    selectedDate = new List.from(_split.reversed).join('.');
                    setState(() {
                      this.menu = getMenu();
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
              Container(
                child: Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 10),
                    children: <Widget>[
                      CupertinoSegmentedControl(
                        selectedColor: Color(0xFF33495E),
                        borderColor: Color(0xFF33495E),
                        pressedColor: Color(0x0033495E),
                        children: {
                          0: Text("Öğlen"),
                          1: Text("Akşam"),
                        },
                        groupValue: selectedType,
                        onValueChanged: (value) {
                          selectedType = value;
                          setState(() {
                            this.menu = getMenu();
                          });
                        },
                      ),
                      menu != null
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: (MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height) -
                                  (MediaQuery.of(context)
                                          .copyWith()
                                          .size
                                          .height /
                                      3),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 0.3),
                                      ),
                                    ),
                                    child: ListTile(
                                      title: menu.buildTitle(index),
                                      subtitle: menu.buildSubTitle(index),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              height: 200,
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'Seçilen güne ait gösterilecek menü bulunamadı!',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF33495E),
                                          fontStyle: FontStyle.italic,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
