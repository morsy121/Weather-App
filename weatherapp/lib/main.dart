import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/provider/weather_proviser.dart';

import 'pages/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getColor(),
      ),
      home: HomePage(),
    );
  }
}
