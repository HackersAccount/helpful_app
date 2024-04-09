import 'package:flutter/material.dart';

import 'pages/converter_home.dart';

void main() {
  runApp(const ZIGtoUSDConverter());
}

class ZIGtoUSDConverter extends StatelessWidget {
  const ZIGtoUSDConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZIG to USD Converter',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFFFFD800,
          <int, Color>{
            50: Color(0xFFFFF9C4),
            100: Color(0xFFFFF59D),
            200: Color(0xFFFFF176),
            300: Color(0xFFFFEE58),
            400: Color(0xFFFFEB3B),
            500: Color(0xFFFFE600),
            600: Color(0xFFFFE600),
            700: Color(0xFFFFD600),
            800: Color(0xFFFFC400),
            900: Color(0xFFFFB300),
          },
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      home: const ConverterHomePage(),
    );
  }
}
