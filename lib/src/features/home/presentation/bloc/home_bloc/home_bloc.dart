import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<_Initial>(_onInitial);
  }

  Future<void> _onInitial(
    _Initial event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: const HomeStatus.loading()));
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const HomeStatus.loaded()));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error(e.toString())));
    }
  }
}