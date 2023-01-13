import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_new/injection.dart';
import 'package:todo_new/presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
