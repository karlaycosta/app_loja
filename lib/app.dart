import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'widgets/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _theme = ThemeNotifier();
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      notifier: _theme,
      child: Builder(
        builder: (context) {
          final theme = ThemeProvider.of(context);
          return MaterialApp(
            theme: ThemeData(
              brightness: theme.isDark ? Brightness.dark : Brightness.light,
              colorSchemeSeed: Colors.blueGrey,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
