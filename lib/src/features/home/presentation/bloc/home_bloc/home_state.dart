part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial()) HomeStatus status,
    String? message,
  }) = _HomeState;
}

@freezed
sealed class HomeStatus with _$HomeStatus {
  const factory HomeStatus.initial() = _InitialStatus;
  const factory HomeStatus.loading() = _LoadingStatus;
  const factory HomeStatus.loaded() = _LoadedStatus;
  const factory HomeStatus.error([String? message]) = _ErrorStatus;
}