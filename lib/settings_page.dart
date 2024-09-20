import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Function onThemeChange;
  final bool isDarkMode;

  SettingsPage({required this.onThemeChange, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengaturan')),
      body: Center(
        child: SwitchListTile(
          title: Text('Mode Gelap'),
          value: isDarkMode,
          onChanged: (value) {
            onThemeChange();
          },
        ),
      ),
    );
  }
}
