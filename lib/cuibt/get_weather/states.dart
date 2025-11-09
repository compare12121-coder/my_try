import 'package:my_try/models/api_model.dart';

class WeatherState{}
class NoWeatherData extends WeatherState{}
class HasWeatherData extends WeatherState{
   WeatherModel? weatherModel;
  HasWeatherData( this.weatherModel);
  
}
class ErrorWeatherData extends WeatherState{}
