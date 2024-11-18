import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'services/weather_api_client.dart';
import 'models/weather.dart';
import 'views/weather_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherApiClient apiClient =
      WeatherApiClient(httpClient: http.Client());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18.0),
          headlineSmall: TextStyle(fontSize: 24.0),
        ),
      ),
      home: WeatherHomePage(apiClient: apiClient),
    );
  }
}
