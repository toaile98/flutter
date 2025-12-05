import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/utils/injections.dart';
import '../../shared/data/data_sources/app_shared_prefs.dart';
import 'presentation/bloc/app_setting_bloc/app_setting_bloc.dart';

Future<void> initAppSettingsInjections() async {
  // Register Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register AppSettingBloc
  sl.registerSingleton<AppSettingBloc>(
    AppSettingBloc(
      appSharedPrefs: sl<AppSharedPrefs>(),
      connectivity: sl<Connectivity>(),
    ),
  );
}
