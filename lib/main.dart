import 'package:flutter/material.dart';
import 'login_page.dart';
import 'event_list_page.dart';
import 'add_event_page.dart';
import 'logout_page.dart';
import 'settings_page.dart';  // Import halaman logout

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/events': (context) => EventListPage(),
        '/addEvent': (context) => AddEventPage(),
        '/logout': (context) => LogoutPage(), // Tambahkan route untuk halaman logout
        '/settings': (context) => SettingsPage(onThemeChange: toggleTheme, isDarkMode: isDarkMode),
      },
    );
  }
}
