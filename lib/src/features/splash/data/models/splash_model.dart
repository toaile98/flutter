import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_model.freezed.dart';
part 'splash_model.g.dart';

@freezed
class SplashModel with _$SplashModel {
  const factory SplashModel({
    required int id,
  }) = _SplashModel;

  factory SplashModel.fromJson(Map<String, dynamic> json) => _$SplashModelFromJson(json);
}