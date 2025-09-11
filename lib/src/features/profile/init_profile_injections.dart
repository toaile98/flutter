import '../../core/utils/injections.dart';
import 'data/datasources/remote/profile_datasource.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/get_profile.dart';
import 'presentation/bloc/profile_bloc/profile_bloc.dart';

initProfileInjections() {
  sl.registerSingleton<ProfileDatasource>(ProfileDatasourceImpl(sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl()));
  sl.registerSingleton<GetProfile>(GetProfile(sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc());
}
