import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:learn/widgets/weather_widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _city = '';
  bool _isLoading = false;
  Map<String, String> _weatherData = {};

  void _showUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Account Info'),
          content: Text('Logged in as: ${user.email}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _handleSearch(String value) async {
    final trimmedValue = value.trim();
    if (trimmedValue.isEmpty) return;

    setState(() {
      _city = trimmedValue;
      _isLoading = true;
      _weatherData = {};
    });

    try {
      final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=0cd4021743d5eb5dbc7c9b33392c7260&units=metric',
      ));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _weatherData = {
            'temp': '${data['main']['temp']?.toStringAsFixed(1)}°C',
            'humidity': '${data['main']['humidity']}%',
            'condition': data['weather'][0]['description'],
          };
        });
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('City "$_city" not found')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching weather data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to connect to weather service')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Buddy 🌈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _showUserEmail,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 103, 66, 252),
              Color.fromARGB(255, 0, 0, 0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CitySearchField(
                controller: _cityController,
                onSearch: _handleSearch,
              ),
              const SizedBox(height: 30),
              if (_isLoading)
                const CircularProgressIndicator(color: Colors.white)
              else if (_weatherData.isNotEmpty)
                Expanded(
                  child: WeatherInfoPanel(
                    city: _city,
                    weatherData: _weatherData,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}