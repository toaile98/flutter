import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_base/src/core/styles/app_theme.dart';
import 'package:flutter_base/src/shared/data/data_sources/app_shared_prefs.dart';
import 'package:flutter_base/src/shared/domain/entities/language_enum.dart';
import 'app_setting_event.dart';
import 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final AppSharedPrefs _appSharedPrefs;
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  AppSettingBloc({
    required AppSharedPrefs appSharedPrefs,
    required Connectivity connectivity,
  })  : _appSharedPrefs = appSharedPrefs,
        _connectivity = connectivity,
        super(AppSettingState.initial()) {
    on<AppSettingInitialized>(_onInitialized);
    on<AppSettingThemeChanged>(_onThemeChanged);
    on<AppSettingLocaleChanged>(_onLocaleChanged);
    on<AppSettingConnectionChanged>(_onConnectionChanged);
    on<AppSettingErrorOccurred>(_onErrorOccurred);
    on<AppSettingClearError>(_onClearError);
  }

  Future<void> _onInitialized(
    AppSettingInitialized event,
    Emitter<AppSettingState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Load initial settings from shared preferences
      final isDarkTheme = _appSharedPrefs.getIsDarkTheme();
      final locale = _appSharedPrefs.getLang() ?? LanguageEnum.en;

      // Check initial connectivity
      final connectivityResults = await _connectivity.checkConnectivity();
      final isConnected = _isConnected(connectivityResults);

      // Start listening to connectivity changes
      _startConnectivityMonitoring();

      emit(state.copyWith(
        isDarkTheme: isDarkTheme,
        locale: locale,
        isConnected: isConnected,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to initialize app settings: $e',
      ));
    }
  }

  Future<void> _onThemeChanged(
    AppSettingThemeChanged event,
    Emitter<AppSettingState> emit,
  ) async {
    try {
      // Save theme preference
      _appSharedPrefs.setDarkTheme(event.isDarkTheme);

      // Update system UI overlay style
      if (event.isDarkTheme) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }

      emit(state.copyWith(isDarkTheme: event.isDarkTheme));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to change theme: $e',
      ));
    }
  }

  Future<void> _onLocaleChanged(
    AppSettingLocaleChanged event,
    Emitter<AppSettingState> emit,
  ) async {
    try {
      // Save locale preference
      _appSharedPrefs.setLang(event.locale);

      emit(state.copyWith(locale: event.locale));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to change locale: $e',
      ));
    }
  }

  Future<void> _onConnectionChanged(
    AppSettingConnectionChanged event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(state.copyWith(isConnected: event.isConnected));
  }

  Future<void> _onErrorOccurred(
    AppSettingErrorOccurred event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(state.copyWith(errorMessage: event.errorMessage));
  }

  Future<void> _onClearError(
    AppSettingClearError event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(state.copyWith(errorMessage: null));
  }

  void _startConnectivityMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final isConnected = _isConnected(results);
        add(AppSettingConnectionChanged(isConnected));
      },
    );
  }

  bool _isConnected(List<ConnectivityResult> results) {
    return results.any((result) => 
      result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi ||
      result == ConnectivityResult.ethernet ||
      result == ConnectivityResult.vpn ||
      result == ConnectivityResult.bluetooth ||
      result == ConnectivityResult.other
    );
  }

  // Helper methods for easy access
  void toggleTheme() {
    add(AppSettingThemeChanged(!state.isDarkTheme));
  }

  void changeLocale(LanguageEnum locale) {
    add(AppSettingLocaleChanged(locale));
  }

  void clearError() {
    add(const AppSettingClearError());
  }

  // Get current theme data
  ThemeData get currentTheme {
    return state.isDarkTheme ? darkAppTheme : appTheme;
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
