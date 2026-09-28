
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class AppColors {
  static const background = Color(0xFF14161B);
  static const surface = Color(0xFF1D2027);
  static const surfaceSoft = Color(0xFF262A33);
  static const accent = Color(0xFFE8A756);
  static const accentSoft = Color(0xFFCFA37C);
  static const textPrimary = Color(0xFFEDEFF2);
  static const textSecondary = Color(0xFF9AA0AC);
  static const divider = Color(0xFF2C303A);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
        ),
        useMaterial3: true,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'WEATHER',
          style: TextStyle(
            letterSpacing: 4.0,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimary),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: const _WeatherBody(),
    );
  }
}

class _WeatherBody extends StatelessWidget {
  const _WeatherBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
           _HeaderImage(),
          Padding(
            padding:  EdgeInsets.fromLTRB(20, 24, 20, 24),
            child: Column(
              children:  <Widget>[
                _WeatherDescription(),
                SizedBox(height: 24),
                _CurrentTemperature(),
                SizedBox(height: 28),
                _ForecastRow(),
                SizedBox(height: 28),
                Divider(color: AppColors.divider, height: 1),
                SizedBox(height: 16),
                _FooterRatings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _HeaderImage extends StatelessWidget {
  const _HeaderImage();

  static const _imageUrl =
      'https://images.unsplash.com/photo-1499956827185-0d63ee78a910?auto=format&fit=crop&w=1200&q=60';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(28),
        bottomRight: Radius.circular(28),
      ),
      child: Stack(
        children: <Widget>[
          Image.network(
            _imageUrl,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                height: 260,
                color: AppColors.surfaceSoft,
                child: const Center(
                  child: CircularProgressIndicator(color: AppColors.accent),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 260,
                color: AppColors.surfaceSoft,
                child: const Center(
                  child: Icon(
                    Icons.cloud_off,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    AppColors.background.withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherDescription extends StatelessWidget {
  const _WeatherDescription();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  <Widget>[
        Text(
          'Tuesday · May 22',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Clear skies, light breeze off the coast. Comfortable temperatures expected through the evening, no precipitation.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14.0,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _CurrentTemperature extends StatelessWidget {
  const _CurrentTemperature();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child:const  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children:  <Widget>[
              Icon(Icons.wb_sunny_rounded, color: AppColors.accent, size: 34),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '15°',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Clear',
                    style: TextStyle(color: AppColors.accentSoft, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Baidibek region ',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              Text(
                'Amansay',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ForecastRow extends StatelessWidget {
  const _ForecastRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final temp = 20 + index;
          return Container(
            width: 68,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surfaceSoft,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.divider),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.cloud_outlined, color: AppColors.accentSoft, size: 20),
                const SizedBox(height: 8),
                Text(
                  '$temp°',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FooterRatings extends StatelessWidget {
  const _FooterRatings();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Info with openweathermap.org',
          style: TextStyle(fontSize: 12.0, color: AppColors.textSecondary),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              Icons.star_rounded,
              size: 16.0,
              color: index < 3 ? AppColors.accent : AppColors.divider,
            );
          }),
        ),
      ],
    );
  }
}