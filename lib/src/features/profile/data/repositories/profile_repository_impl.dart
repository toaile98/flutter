import '../../domain/repositories/profile_repository.dart';
import '../datasources/remote/profile_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource profileApi;

  ProfileRepositoryImpl(this.profileApi);

  // TODO: Implement repository methods
}