import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/extension/space_extensions_helper.dart';

import '../../../../core/widgets/animated_switcher_wrapper.dart';
import '../../../../core/widgets/gradient_background.dart';
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
      body: GradientBackground(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.heightSpace,
                    _buildSearchField(),
                    32.heightSpace,
                    _buildWeatherSection(),
                  ],
                ),
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
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.weather != null) {
          return AnimatedSwitcherWrapper(
            child: WeatherCard(weather: provider.weather!),
          );
        }

        if (provider.errorMessage != null) {
          return AnimatedSwitcherWrapper(
            child: WeatherError(message: provider.errorMessage!),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
