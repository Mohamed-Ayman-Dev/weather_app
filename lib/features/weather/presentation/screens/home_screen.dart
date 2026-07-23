import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_error.dart';
import '../widgets/weather_search_field.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSearchField(),
                  const SizedBox(height: 32),
                  _buildWeatherSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Selector<WeatherProvider, bool>(
      selector: (_, provider) => provider.isLoading,
      builder: (_, isLoading, __) {
        return WeatherSearchField(
          controller: _cityController,
          isLoading: isLoading,
          onSearch: context.read<WeatherProvider>().searchCity,
        );
      },
    );
  }

  Widget _buildWeatherSection() {
    return Selector<WeatherProvider, WeatherProvider>(
      selector: (_, provider) => provider,
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.weather != null) {
          return WeatherCard(weather: provider.weather!);
        }

        if (provider.errorMessage != null) {
          return WeatherError(message: provider.errorMessage!);
        }

        return const SizedBox.shrink();
      },
    );
  }
}