import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/cuibt/get_weather/states.dart';
import 'package:my_try/logic/api_logic.dart';
import 'package:my_try/models/api_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherData());

  void getWeatherData({required String city}) async {
    try {
      WeatherModel? weather;
      weather = await Weatherapi().getWeather(city: city);
      emit(HasWeatherData());
    } catch (e) {
      emit(ErrorWeatherData());
    }
  }
}
