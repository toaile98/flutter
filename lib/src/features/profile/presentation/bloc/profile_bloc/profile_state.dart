part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial()) ProfileStatus status,
    String? message,
  }) = _ProfileState;
}

@freezed
sealed class ProfileStatus with _$ProfileStatus {
  const factory ProfileStatus.initial() = _InitialStatus;
  const factory ProfileStatus.loading() = _LoadingStatus;
  const factory ProfileStatus.loaded() = _LoadedStatus;
  const factory ProfileStatus.error([String? message]) = _ErrorStatus;
}