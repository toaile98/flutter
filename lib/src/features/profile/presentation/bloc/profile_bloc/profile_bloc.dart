import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<_Initial>(_onInitial);
  }

  Future<void> _onInitial(
    _Initial event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: const ProfileStatus.loading()));
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const ProfileStatus.loaded()));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error(e.toString())));
    }
  }
}