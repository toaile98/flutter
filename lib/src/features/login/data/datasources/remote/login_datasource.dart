import 'package:dio/dio.dart';

abstract class LoginDatasource {
  Future<void> get();
}

class LoginDatasourceImpl implements LoginDatasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  LoginDatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}