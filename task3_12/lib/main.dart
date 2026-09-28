import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Murmansk Oblast, RU',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Friday, Mar 20, 2020',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 75,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '14 °F',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 43,
                          ),
                        ),
                        Text(
                          'LIGHT SNOW',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 45),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    WeatherInfo(
                      icon: Icons.ac_unit,
                      value: '5',
                      label: 'km/hr',
                    ),
                    WeatherInfo(
                      icon: Icons.ac_unit,
                      value: '3',
                      label: '%',
                    ),
                    WeatherInfo(
                      icon: Icons.ac_unit,
                      value: '20',
                      label: '%',
                    ),
                  ],
                ),

                const SizedBox(height: 45),

                const Text(
                  '7-DAY WEATHER FORECAST',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 105,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ForecastCard(
                        day: 'Friday',
                        temperature: '6 °F',
                      ),
                      ForecastCard(
                        day: 'Saturday',
                        temperature: '5 °F',
                      ),
                      ForecastCard(
                        day: 'Sunday',
                        temperature: '22 °F',
                      ),
                      ForecastCard(
                        day: 'Monday',
                        temperature: '18 °F',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const WeatherInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class ForecastCard extends StatelessWidget {
  final String day;
  final String temperature;

  const ForecastCard({
    super.key,
    required this.day,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temperature,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.wb_sunny,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}