import 'package:equatable/equatable.dart';

import 'package:flutter_base/src/shared/domain/entities/language_enum.dart';

abstract class AppSettingEvent extends Equatable {
  const AppSettingEvent();

  @override
  List<Object?> get props => [];
}

class AppSettingInitialized extends AppSettingEvent {
  const AppSettingInitialized();
}

class AppSettingThemeChanged extends AppSettingEvent {
  final bool isDarkTheme;

  const AppSettingThemeChanged(this.isDarkTheme);

  @override
  List<Object?> get props => [isDarkTheme];
}

class AppSettingLocaleChanged extends AppSettingEvent {
  final LanguageEnum locale;

  const AppSettingLocaleChanged(this.locale);

  @override
  List<Object?> get props => [locale];
}

class AppSettingConnectionChanged extends AppSettingEvent {
  final bool isConnected;

  const AppSettingConnectionChanged(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}

class AppSettingErrorOccurred extends AppSettingEvent {
  final String errorMessage;

  const AppSettingErrorOccurred(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AppSettingClearError extends AppSettingEvent {
  const AppSettingClearError();
}
