import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<_Initial>(_onInitial);
  }

  Future<void> _onInitial(
    _Initial event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: const LoginStatus.loading()));
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const LoginStatus.loaded()));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error(e.toString())));
    }
  }
}