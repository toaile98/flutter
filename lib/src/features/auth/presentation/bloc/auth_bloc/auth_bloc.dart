import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.unknown()) {
    on<_Initial>(_onInitial);
    on<_Login>(_onLogin);
    on<_Logout>(_onLogout);
    add(AuthEvent.initial());
  }

  Future<void> _onInitial(_Initial event, Emitter<AuthState> emit) async {
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthState.authenticated(user: UserEntity(id: 1)));
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.unknown());
    }
  }

  FutureOr<void> _onLogin(_Login event, Emitter<AuthState> emit) {
    log("message login");
    emit(AuthState.authenticated(user: UserEntity(id: 1)));
  }

  FutureOr<void> _onLogout(_Logout event, Emitter<AuthState> emit) {
    emit(AuthState.unauthenticated());
  }
}
