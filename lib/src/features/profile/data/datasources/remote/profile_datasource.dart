import 'package:dio/dio.dart';

abstract class ProfileDatasource {
  Future<void> get();
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  ProfileDatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}