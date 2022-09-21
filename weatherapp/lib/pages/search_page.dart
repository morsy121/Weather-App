import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/provider/weather_proviser.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) async {
              cityName = data;

              WeatherServices services = WeatherServices();

              WeatherModel? weather =
                  await services.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);

              print(weather);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                label: Text("search"),
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherServices services = WeatherServices();

                      WeatherModel? weather =
                          await services.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                hintText: "Enter a City"),
          ),
        ),
      ),
    );
  }
}
