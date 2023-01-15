import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todo_new/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(scheme: FlexScheme.green)
          .copyWith(inputDecorationTheme: _inputDecorationTheme),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.green)
          .copyWith(inputDecorationTheme: _inputDecorationTheme),
      title: 'Material App',
      home: const SignInPage(),
    );
  }
}
