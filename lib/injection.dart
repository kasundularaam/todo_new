import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_new/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String env) => getIt.init(environment: env);
