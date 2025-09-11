import '../../core/utils/injections.dart';
import 'data/datasources/remote/login_datasource.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/get_login.dart';
import 'presentation/bloc/login_bloc/login_bloc.dart';

initLoginInjections() {
  sl.registerSingleton<LoginDatasource>(LoginDatasourceImpl(sl()));
  sl.registerSingleton<LoginRepository>(LoginRepositoryImpl(sl()));
  sl.registerSingleton<GetLogin>(GetLogin(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc());
}
