import 'package:dio/dio.dart';
import 'package:my_try/models/api_model.dart';

class Weatherapi{
final String  baseUrl ='https://api.weatherapi.com/v1';
final String apiKey='18d77b40cb1a4697ba3120758251110';
final Dio dio=Dio();
Future <WeatherModel?> getWeather({ city }) async {
try {
  Response response=await  dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1') ;
  WeatherModel   weatherModel= WeatherModel.fromJson(response.data);
    return weatherModel;
}on DioException catch (e) {String errorMessage=e.response?.data['error']['message']??'Something went wrong';
  throw Exception(errorMessage);
}
  
}}