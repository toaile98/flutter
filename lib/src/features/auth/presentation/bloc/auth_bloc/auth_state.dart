part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unknown() = UnknownAuthState;

  const factory AuthState.authenticated({required UserEntity user}) =
      AuthenticatedState;

  const factory AuthState.unauthenticated() = UnauthenticatedState;

  const AuthState._();
}

@freezed
sealed class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = _InitialStatus;
  const factory AuthStatus.loading() = _LoadingStatus;
  const factory AuthStatus.loaded() = _LoadedStatus;
  const factory AuthStatus.error([String? message]) = _ErrorStatus;
}
