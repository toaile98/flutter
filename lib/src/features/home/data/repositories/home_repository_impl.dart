import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeApi;

  HomeRepositoryImpl(this.homeApi);

  // TODO: Implement repository methods
}