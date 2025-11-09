import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/cuibt/get_weather/cubic.dart';
import 'package:my_try/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<GetWeatherCubit>(context).weather;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ 
            TheColor(weather!.description).shade200,
            TheColor(weather.description).shade400,
            TheColor(weather.description).shade500,
            TheColor(weather.description).shade600,
            TheColor(weather.description).shade700,
            TheColor(weather.description).shade800,
            TheColor(weather.description).shade900,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.city,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text('updated${weather.dataTime.hour}:${weather.dataTime.minute}   ', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weather.imageUrl}'),
                Text(
                  weather.averageTemp.round().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'Maxntemp ${weather.maxTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                     'Mintemp ${weather.minTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weather.description,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
