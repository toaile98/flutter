part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStatus.initial()) LoginStatus status,
    String? message,
  }) = _LoginState;
}

@freezed
sealed class LoginStatus with _$LoginStatus {
  const factory LoginStatus.initial() = _InitialStatus;
  const factory LoginStatus.loading() = _LoadingStatus;
  const factory LoginStatus.loaded() = _LoadedStatus;
  const factory LoginStatus.error([String? message]) = _ErrorStatus;
}