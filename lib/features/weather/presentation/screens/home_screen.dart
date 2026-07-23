import 'package:flutter/material.dart';


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
    // final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: SafeArea(
        child: Center(
          // Bonus: responsive design — caps content width on large/tablet
          // screens instead of letting the search field and card stretch
          // edge-to-edge.
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // WeatherSearchField(
                  //   controller: _cityController,
                  //   isLoading: provider.state == WeatherViewState.loading,
                  //   onSearch: (city) => provider.searchCity(city),
                  // ),
                  // const SizedBox(height: 24),
                  // _buildResultArea(provider),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildResultArea(WeatherProvider provider) {
  //   switch (provider.state) {
  //     case WeatherViewState.idle:
  //       return const SizedBox.shrink();
  //     case WeatherViewState.loading:
  //       return const Padding(
  //         padding: EdgeInsets.only(top: 32),
  //         child: Center(child: CircularProgressIndicator()),
  //       );
  //     case WeatherViewState.success:
  //       return WeatherDisplayCard(weather: provider.weather!);
  //     case WeatherViewState.error:
  //       return WeatherErrorView(message: provider.errorMessage!);
  //   }
  // }
}
