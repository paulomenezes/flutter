import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/screens/detail/plant_detail_screen.dart';
import 'package:challenge_ui_plant_app/screens/grid/grid_screen.dart';
import 'package:challenge_ui_plant_app/screens/home/home_screen.dart';
import 'package:challenge_ui_plant_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/grid': (context) => const GridScreen(),
        '/detail': (context) => const PlantDetailScreen(),
      },
      initialRoute: '/',
    );
  }
}
