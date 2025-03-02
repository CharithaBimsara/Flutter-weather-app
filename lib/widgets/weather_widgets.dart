import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          const SizedBox(height: 50),
          CitySearchField(controller: _controller, onSearch: (city) {}),
          const SizedBox(height: 20),
          WeatherInfoPanel(
            city: "New York",
            weatherData: {
              'temp': '25°',
              'humidity': '60%',
              'condition': 'Mostly Cloudy',
            },
          ),
          const SizedBox(height: 20),
          WeatherForecastRow(),
        ],
      ),
    );
  }
}

class CitySearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CitySearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          hintText: '🌍 Enter City Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
        onSubmitted: onSearch,
      ),
    );
  }
}

class WeatherInfoPanel extends StatelessWidget {
  final String city;
  final Map<String, String> weatherData;

  const WeatherInfoPanel({
    super.key,
    required this.city,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Icon(Icons.wb_cloudy, size: 80, color: Colors.white),
        Text(
          weatherData['temp'] ?? '',
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
        Text(
          weatherData['condition'] ?? '',
          style: const TextStyle(fontSize: 20, color: Colors.white70),
        ),
        const SizedBox(height: 20),
        Column(
          
          children: [
            WeatherInfoCard(icon: '💧', value: weatherData['humidity'] ?? '', label: 'Humidity'),
            const SizedBox(height: 50),
            WeatherInfoCard(icon: '🌈', value: weatherData['condition'] ?? '', label: 'Condition'),
          ],
        ),
      ],
    );
  }
}

class WeatherInfoCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const WeatherInfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set a fixed width to match both cards
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class WeatherForecastRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return Column(
            children: const [
              Icon(Icons.wb_sunny, color: Colors.white),
              Text('25°', style: TextStyle(color: Colors.white)),
              Text('Fri', style: TextStyle(color: Colors.white70)),
            ],
          );
        }),
      ),
    );
  }
}
