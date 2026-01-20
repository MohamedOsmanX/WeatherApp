import 'dart:convert';

import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
 Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDatasource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName)async {
    try {
      var response = await Dio().get('${AppConstants.baseUrl}/weather?q=$countryName&appid=${AppConstants.appId}');
      print(response);
      return WeatherModel.fromJson(response.data);
    } catch(e) {
     print(e);
     return null; 
    }

  }

}