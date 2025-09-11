import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({required int id}) = _UserEntity;
}
