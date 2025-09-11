part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.initial()) SplashStatus status,
    String? message,
  }) = _SplashState;
}

@freezed
sealed class SplashStatus with _$SplashStatus {
  const factory SplashStatus.initial() = _InitialStatus;
  const factory SplashStatus.loading() = _LoadingStatus;
  const factory SplashStatus.loaded() = _LoadedStatus;
  const factory SplashStatus.error([String? message]) = _ErrorStatus;
}