class WeatherModel {
  final String city;
  final String description;
  final double maxTemp;
  final double minTemp;
  final String imageUrl;
  final double averageTemp;
  final DateTime dataTime;

  WeatherModel({
    required this.dataTime,
    required this.city,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
    required this.imageUrl,
    required this.averageTemp,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
      : city = json['location']['name'],
        averageTemp = json['forecast']["forecastday"][0]["day"]['avgtemp_c'],
        description = json['forecast']["forecastday"][0]["day"]["condition"]['text'],
        maxTemp = json['forecast']["forecastday"][0]['day']['maxtemp_c'],
        minTemp = json['forecast']["forecastday"][0]['day']['mintemp_c'],
        imageUrl = json['forecast']["forecastday"][0]["day"]["condition"]['icon'],
        dataTime = DateTime.parse(json['location']['localtime']);
}
