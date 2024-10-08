import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherApiClient {
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final http.Client httpClient;

  WeatherApiClient({required this.httpClient});

  Future<Weather> getWeather(String city) async {
    final url = '$_baseUrl?q=$city&appid=8aa979297dac5b009b77a0f1bb937200&units=metric&lang=pt_br';
    final response = await httpClient.get(Uri .parse(url));

    if (response.statusCode != 200){
      throw Exception('Erro ao obter dados do clima');
    }

    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }
}