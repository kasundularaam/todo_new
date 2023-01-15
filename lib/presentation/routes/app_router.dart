import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_new/presentation/splash/splash_page.dart';

import '../sign_in/sign_in_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage),
    AutoRoute(page: SplashPage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
