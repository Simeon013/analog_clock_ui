import 'package:analog_clock_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/my_theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyThemeProvider(),
      child: Consumer<MyThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Analog Clock',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.themeMode,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
