import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_advanced_app/app/app_preferences.dart';
import 'package:flutter_advanced_app/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_app/data/network/app_api.dart';
import 'package:flutter_advanced_app/data/network/dio_factory.dart';
import 'package:flutter_advanced_app/data/network/network_info.dart';
import 'package:flutter_advanced_app/data/repository/repository_implementer.dart';
import 'package:flutter_advanced_app/domain/repository/repository.dart';
import 'package:flutter_advanced_app/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/login_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // share prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(Connectivity()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remove data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementer(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
