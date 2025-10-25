import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/cuibt/get_weather/cubic.dart';
import 'package:my_try/models/api_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Center(
          child:  TextField(
            onSubmitted: (value) {
                 var getweather= BlocProvider.of<GetWeatherCubit>(context);
                  getweather.getWeatherData(city:  value);              
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
          
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              hintText: 'Enter city name',
              labelText: 'City Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)
            )
          ,        ),
          ),
              ),
        ),
      ));
  }
}
WeatherModel? weatherModel;