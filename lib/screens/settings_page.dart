import 'package:flutter/material.dart';
import 'package:bookmate/screens/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsTile(
            icon: Icons.security_outlined,
            label: 'Privacy Policy',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.fact_check_outlined,
            label: 'Terms of Service',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
