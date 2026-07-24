import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/animated_switcher_wrapper.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_error.dart';
import '../widgets/weather_placeholder.dart';
import '../widgets/weather_search_field.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    const SizedBox(height: 20),
                    _buildSearchField(),
                    const SizedBox(height: 32),
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
          formKey: _formKey,
          isLoading: isLoading,
          onSearch: context.read<WeatherProvider>().searchCity,
        );
      },
    );
  }

  Widget _buildWeatherSection() {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return AnimatedSwitcherWrapper(child: _buildContent(provider));
      },
    );
  }

  Widget _buildContent(WeatherProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.weather != null) {
      return WeatherCard(weather: provider.weather!);
    }

    if (provider.errorMessage != null) {
      return WeatherError(
        message: provider.errorMessage!,
        onTryAgain: () {
          provider.searchCity(_cityController.text);
        },
      );
    }

    return const WeatherPlaceholder();
  }
}
