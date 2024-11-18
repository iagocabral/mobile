// lib/views/weather_home_page.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../services/weather_api_client.dart';

class WeatherHomePage extends StatefulWidget {
  final WeatherApiClient apiClient;

  WeatherHomePage({required this.apiClient});

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final _cityController = TextEditingController();
  Weather? _weather;
  bool _isLoading = false;

  Future<void> _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weather = await widget.apiClient.getWeather(_cityController.text.trim());
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackbar();
    }
  }

  void _showErrorSnackbar() {
    final snackBar = SnackBar(content: Text('Cidade não encontrada'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de entrada para o nome da cidade
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _fetchWeather,
                ),
              ),
              onFieldSubmitted: (_) => _fetchWeather(),
            ),
            SizedBox(height: 20),
            // Exibição dos dados do clima ou indicador de carregamento
            if (_isLoading)
              CircularProgressIndicator()
            else if (_weather != null)
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Image.network(
                        'http://openweathermap.org/img/wn/${_weather!.iconCode}@2x.png',
                      ),
                      title: Text(
                        '${_weather!.temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 40),
                      ),
                      subtitle: Text(
                        _weather!.description.capitalize(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _weather!.cityName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Extensão para capitalizar a primeira letra de uma string
extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}