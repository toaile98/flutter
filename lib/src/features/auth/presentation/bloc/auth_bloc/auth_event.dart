part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial() = _Initial;
  const factory AuthEvent.login() = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.updateAuth() = _UpdateAuth;
}
