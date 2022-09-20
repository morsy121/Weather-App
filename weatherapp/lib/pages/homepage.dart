import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/provider/weather_proviser.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'There is no Weather 😞 start ',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Searching Now 🔎 ',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ))
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text('updated at :',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        "${weatherData!.temp.toInt()}",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('Maxtemp : ${weatherData!.maxtemp.toInt()}'),
                          Text('Mintemp : ${weatherData!.mintemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
