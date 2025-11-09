import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_try/cuibt/get_weather/states.dart';
import 'package:my_try/logic/api_logic.dart';
import 'package:my_try/models/api_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherData());
 WeatherModel? weather;
  void getWeatherData({required String city}) async {
    try {
      
      weather = await Weatherapi().getWeather(city: city);
      emit(HasWeatherData( weather));
    } catch (e) {
      emit(ErrorWeatherData());
    }
  }
}
