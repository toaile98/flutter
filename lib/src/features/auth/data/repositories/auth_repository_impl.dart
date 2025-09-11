import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authApi;

  AuthRepositoryImpl(this.authApi);

  // TODO: Implement repository methods
}