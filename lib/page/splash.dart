import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<void> _onContinuePressed(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenWelcome', true);

    // Navigate to home, replacing so back button doesn't come back to welcome
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) =>
            const MyHomePage(title: 'Skipped due hasSeenWelcome = true'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    Widget logo;
    if (brightness == Brightness.dark) {
      logo = SvgPicture.asset(
        'assets/headers/stripes-dark.svg',
        width: 120,
        height: 120,
      );
    } else {
      logo = SvgPicture.asset(
        'assets/headers/stripes-light.svg',
        width: 120,
        height: 120,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              const SizedBox(height: 40),
              const Text(
                'Thanks for downloading this app!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Press the button below to continue',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _onContinuePressed(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Continue', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
