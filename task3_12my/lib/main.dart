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

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  int selectedDay = 0;

  final List<Map<String, dynamic>> weather = [
    {
      'day': 'Monday',
      'short': 'MON',
      'temp': '14°C',
      'weather': 'Light Snow',
      'icon': Icons.wb_sunny,
      'wind': '5 km/h',
    },
    {
      'day': 'Tuesday',
      'short': 'TUE',
      'temp': '16°C',
      'weather': 'Sunny',
      'icon': Icons.wb_sunny,
      'wind': '7 km/h',
    },
    {
      'day': 'Wednesday',
      'short': 'WED',
      'temp': '12°C',
      'weather': 'Cloudy',
      'icon': Icons.cloud,
      'wind': '10 km/h',
    },
    {
      'day': 'Thursday',
      'short': 'THU',
      'temp': '10°C',
      'weather': 'Snow',
      'icon': Icons.ac_unit,
      'wind': '12 km/h',
    },
    {
      'day': 'Friday',
      'short': 'FRI',
      'temp': '18°C',
      'weather': 'Sunny',
      'icon': Icons.wb_sunny,
      'wind': '6 km/h',
    },
    {
      'day': 'Saturday',
      'short': 'SAT',
      'temp': '20°C',
      'weather': 'Clear',
      'icon': Icons.wb_sunny,
      'wind': '4 km/h',
    },
    {
      'day': 'Sunday',
      'short': 'SUN',
      'temp': '15°C',
      'weather': 'Cloudy',
      'icon': Icons.cloud,
      'wind': '8 km/h',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather[selectedDay];

    return Scaffold(
      backgroundColor: Colors.deepPurple,

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              // Search
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // City
              const Text(
                'Almaty, KZ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Selected day
              Text(
                currentWeather['day'],
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // Weather icon
              Icon(
                currentWeather['icon'],
                color: Colors.white,
                size: 80,
              ),

              const SizedBox(height: 10),

              // Temperature
              Text(
                currentWeather['temp'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w300,
                ),
              ),

              // Weather
              Text(
                currentWeather['weather'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              // Wind
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.air,
                    color: Colors.white,
                    size: 22,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    currentWeather['wind'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '7-DAY WEATHER FORECAST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Days
              SizedBox(
                height: 100,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weather.length,

                  itemBuilder: (context, index) {
                    final day = weather[index];

                    final bool isSelected =
                        selectedDay == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                        });
                      },

                      child: Container(
                        width: 90,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : Colors.white.withOpacity(0.25),

                          borderRadius:
                              BorderRadius.circular(15),

                          border: Border.all(
                            color: Colors.white,
                            width: isSelected ? 2 : 0,
                          ),
                        ),

                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [

                            Text(
                              day['short'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Icon(
                              day['icon'],
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.white,
                              size: 28,
                            ),

                            const SizedBox(height: 5),

                            Text(
                              day['temp'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}