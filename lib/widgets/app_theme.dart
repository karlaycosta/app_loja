// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedNotifier<ThemeNotifier> {
  const ThemeProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ThemeNotifier of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'ThemeProvider não encontrado nesse contexto!');
    return result!.notifier!;
  }

  static ThemeNotifier read(BuildContext context) {
    final result = context.getInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'ThemeProvider não encontrado nesse contexto!');
    return result!.notifier!;
  }
}

class ThemeNotifier with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void swap() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
