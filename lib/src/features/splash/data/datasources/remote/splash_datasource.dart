import 'package:dio/dio.dart';

abstract class SplashDatasource {
  Future<void> get();
}

class SplashDatasourceImpl implements SplashDatasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  SplashDatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}