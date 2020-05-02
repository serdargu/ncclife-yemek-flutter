import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'restaurant_menu_screen.dart';
import '../models/restaurant_response.dart';
import '../models/restaurant.dart';
import '../api/v1.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  Restaurants createState() {
    return new Restaurants();
  }
}

class Restaurants extends State<RestaurantScreen> {
  RestaurantResponse response;
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    final api = Provider.of<RestClient>(context, listen: false);
    api.getRestaurantResponse().then((it) {
      setState(() {
        response = it;
        restaurants = response.getRestaurants();
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
          "Restoranlar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF3AAD98),
      ),
      child: Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          // Let the ListView know how many items it needs to build.
          itemCount: restaurants.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.3),
                ),
              ),
              child: ListTile(
                title: restaurant.buildTitle(context),
                subtitle: restaurant.buildSubtitle(context),
                onTap: () => {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RestaurantMenu(
                        title: restaurant.getName(),
                        restaurant: restaurant,
                      ),
                    ),
                  )
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
