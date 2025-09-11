import 'package:dio/dio.dart';

abstract class AuthDatasource {
  Future<void> get();
}

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  AuthDatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}