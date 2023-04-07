import 'package:flutter_web_test/service_test.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ServiceTest());
}
