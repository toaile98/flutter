import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_base/src/shared/domain/entities/language_enum.dart';

class AppSettingState extends Equatable {
  final bool isDarkTheme;
  final bool isConnected;
  final LanguageEnum locale;
  final bool isLoading;
  final String? errorMessage;

  const AppSettingState({
    required this.isDarkTheme,
    required this.isConnected,
    required this.locale,
    this.isLoading = false,
    this.errorMessage,
  });

  factory AppSettingState.initial() {
    return const AppSettingState(
      isDarkTheme: false,
      isConnected: true,
      locale: LanguageEnum.en,
      isLoading: false,
      errorMessage: null,
    );
  }

  AppSettingState copyWith({
    bool? isDarkTheme,
    bool? isConnected,
    LanguageEnum? locale,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AppSettingState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      isConnected: isConnected ?? this.isConnected,
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Locale get localeData => Locale(locale.local);

  @override
  List<Object?> get props => [
        isDarkTheme,
        isConnected,
        locale,
        isLoading,
        errorMessage,
      ];
}
