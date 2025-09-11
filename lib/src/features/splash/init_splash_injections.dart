import '../../core/utils/injections.dart';
import 'data/datasources/remote/splash_datasource.dart';
import 'data/repositories/splash_repository_impl.dart';
import 'domain/repositories/splash_repository.dart';
import 'domain/usecases/get_splash.dart';
import 'presentation/bloc/splash_bloc/splash_bloc.dart';

initSplashInjections() {
  sl.registerSingleton<SplashDatasource>(SplashDatasourceImpl(sl()));
  sl.registerSingleton<SplashRepository>(SplashRepositoryImpl(sl()));
  sl.registerSingleton<GetSplash>(GetSplash(sl()));
  sl.registerFactory<SplashBloc>(() => SplashBloc());
}
