import '../../domain/repositories/login_repository.dart';
import '../datasources/remote/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginApi;

  LoginRepositoryImpl(this.loginApi);

  // TODO: Implement repository methods
}