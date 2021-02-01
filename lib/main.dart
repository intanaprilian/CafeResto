import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irwan_pingpong/core/viewmodels/collection_provider.dart';
import 'package:irwan_pingpong/core/viewmodels/location_provider.dart';
import 'package:irwan_pingpong/core/viewmodels/restaurant_provider.dart';
import 'package:irwan_pingpong/injector.dart';
import 'package:irwan_pingpong/ui/constant/constant.dart';
import 'package:irwan_pingpong/ui/router/router_generator.dart';

void main() {
  //* Register DI
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CollectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Irwan Restoh',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: primaryColor,
          primaryColor: primaryColor,
          cursorColor: primaryColor,
          fontFamily: 'NunitoSans',
          scaffoldBackgroundColor: Colors.white,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
              TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
            },
          ),
        ),
        initialRoute: RouterGenerator.routeHome,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
