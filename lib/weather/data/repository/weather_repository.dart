import 'package:weather_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  
  final BaseRemoteDataSource remoteDatasource;

  WeatherRepository(this.remoteDatasource);

  
 @override
 Future<Weather> getWeatherByCityName(String countryName) async{
  return (await remoteDatasource.getWeatherByCountryName(countryName))!;
 }
}