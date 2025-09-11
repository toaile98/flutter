import '../../core/utils/injections.dart';
import 'data/datasources/remote/auth_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/get_auth.dart';
import 'presentation/bloc/auth_bloc/auth_bloc.dart';

initAuthInjections() {
  sl.registerSingleton<AuthDatasource>(AuthDatasourceImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<GetAuth>(GetAuth(sl()));
  sl.registerSingleton<AuthBloc>(AuthBloc());
}
