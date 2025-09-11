import 'package:dio/dio.dart';
import 'package:flutter_base/src/core/utils/constant/flavor_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/init_auth_injections.dart';
import '../../features/home/init_home_injections.dart';
import '../../features/login/init_login_injections.dart';
import '../../features/profile/init_profile_injections.dart';
import '../../features/splash/init_splash_injections.dart';
import '../../shared/app_injections.dart';
import '../network/dio_network.dart';
import 'log/app_logger.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await flavorConfigInjections();
  await initAppInjections();
  await initDioInjections();

  await initAuthInjections();

  await initSplashInjections();

  await initHomeInjections();

  await initLoginInjections();

  await initProfileInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  sl.registerSingletonAsync<FlutterSecureStorage>(() async {
    return FlutterSecureStorage();
  });
  await sl.isReady<SharedPreferences>();
  await sl.isReady<FlutterSecureStorage>();
}

flavorConfigInjections() async {
  FlavorConfig.initialize(
    apiUrl: const String.fromEnvironment("BASE_URL"),
    flavor: const String.fromEnvironment("FLAVOR"),
  );
  sl.registerSingleton<FlavorConfig>(FlavorConfig.instance);
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  await DioNetwork.initDio();

  sl.registerSingleton<Dio>(DioNetwork.appAPI);
}
