import '../../core/utils/injections.dart';
import 'data/datasources/remote/home_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/get_home.dart';
import 'presentation/bloc/home_bloc/home_bloc.dart';

initHomeInjections() {
  sl.registerSingleton<HomeDatasource>(HomeDatasourceImpl(sl()));
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton<GetHome>(GetHome(sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
