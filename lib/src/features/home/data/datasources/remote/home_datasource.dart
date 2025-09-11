import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<void> get();
}

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  HomeDatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}