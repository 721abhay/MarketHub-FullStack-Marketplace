import 'package:flutter/material.dart';

class WeatherSpecializedScreen extends StatelessWidget {
  static const String routeName = '/weather-center';
  const WeatherSpecializedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue[400]!, Colors.blue[600]!], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                const Spacer(),
                _buildMainWeather(),
                const Spacer(),
                _buildForecastRack(),
                const SizedBox(height: 40),
              ],
            ),
          ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(padding: EdgeInsets.all(24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Icon(Icons.menu, color: Colors.white), Column(children: [Text('New York', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)), Text('Monday, 12 Jan', style: TextStyle(color: Colors.white70))]), Icon(Icons.location_on, color: Colors.white)]));
  }

  Widget _buildMainWeather() {
    return const Column(
      children: [
         Icon(Icons.wb_sunny_rounded, color: Colors.amber, size: 100),
         SizedBox(height: 24),
         Text('24°', style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w100)),
         Text('Sunny • High 26° Low 18°', style: TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }

  Widget _buildForecastRack() {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(24)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('${12 + index} PM', style: const TextStyle(color: Colors.white70, fontSize: 11)), const Icon(Icons.wb_cloudy_rounded, color: Colors.white, size: 24), const Text('22°', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
          );
        },
      ),
    );
  }
}
