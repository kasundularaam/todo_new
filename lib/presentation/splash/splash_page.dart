import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../application/auth/bloc/auth_bloc.dart';
import '../core/assets.dart';
import '../routes/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (s) {},
          authenticated: (s) => print("I'm authenticated"),
          unauthenticated: (s) => AutoRouter.of(context).replaceAll(
            [const SignInRoute()],
          ),
        );
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            Assets.splash,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
