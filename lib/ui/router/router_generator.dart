import 'package:flutter/material.dart';
import 'package:irwan_pingpong/core/models/collection_model.dart';
import 'package:irwan_pingpong/core/models/restaurant_model.dart';
import 'package:irwan_pingpong/ui/screens/home/home_screen.dart';
import 'package:irwan_pingpong/ui/screens/restaurant/restaurant_by_collection_screen.dart';
import 'package:irwan_pingpong/ui/screens/restaurant/restaurant_detail_screen.dart';
import 'package:irwan_pingpong/ui/screens/restaurant/restaurant_search_screen.dart';

class RouterGenerator {

  //* Routing list
  static const routeHome = "/home";
  static const routeDetailRestaurant = "/restaurant/detail";
  static const routeRestaurantByCollection = "/restaurant/collection";
  static const routeRestaurantSearch = "/restaurant/search";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case routeRestaurantSearch:
        return MaterialPageRoute(builder: (_) => RestaurantSearchScreen());
        break;
      case routeDetailRestaurant:

        if (args is RestaurantModel) {
          return MaterialPageRoute(builder: (_) => RestaurantDetailScreen(
            restaurant: args,
          ));
        }
        break;
      case routeRestaurantByCollection:
        if (args is CollectionModel) {
          return MaterialPageRoute(builder: (_) => RestaurantByCollectionScreen(
            collection: args,
          ));
        }
        break;
    }
  }
}