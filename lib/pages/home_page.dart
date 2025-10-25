import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/as/new_state.dart';
import 'package:my_try/as/no.dart';
import 'package:my_try/cuibt/get_weather/cubic.dart';
import 'package:my_try/cuibt/get_weather/states.dart';
import 'package:my_try/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage(),),
              );
            },
          ),
        ],
      ),
      body:BlocBuilder< GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is NoWeatherData) {
          return const Noo();
        } else if (state is HasWeatherData) {
          return const WeatherInfoBody();
        } else {
          return const Center(child: Text('Error fetching weather data'));
        }
      }, ),
    );
  }
}
