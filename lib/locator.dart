import 'package:get_it/get_it.dart';
import 'package:haggle_x_test/data/repository/remote_repository.dart';
import 'package:haggle_x_test/data/repository/local_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RemoteRepository());
  locator.registerLazySingleton(() => LocalRepository());
}
