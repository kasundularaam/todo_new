import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/bloc/auth_bloc.dart';
import '../../injection.dart';
import '../routes/app_router.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: FlexThemeData.light(scheme: FlexScheme.green)
            .copyWith(inputDecorationTheme: _inputDecorationTheme),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.green)
            .copyWith(inputDecorationTheme: _inputDecorationTheme),
        title: "Todo New",
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
