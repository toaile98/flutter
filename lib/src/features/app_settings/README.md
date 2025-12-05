# AppSettingsBloc

A comprehensive Flutter Bloc for managing app-wide settings including theme, locale, and network connectivity.

## Features

- **Theme Management**: Toggle between light and dark themes
- **Locale Management**: Switch between different languages (English, Vietnamese)
- **Network Connectivity**: Monitor and react to network connection changes
- **Persistent Storage**: Settings are automatically saved to SharedPreferences
- **Error Handling**: Comprehensive error handling with user feedback

## Usage

### 1. Basic Setup

The AppSettingBloc is already integrated into your main app. It's automatically initialized when the app starts.

### 2. Accessing the Bloc

```dart
// In any widget
BlocBuilder<AppSettingBloc, AppSettingState>(
  builder: (context, state) {
    return Text('Theme: ${state.isDarkTheme ? "Dark" : "Light"}');
  },
)
```

### 3. Changing Settings

```dart
// Toggle theme
context.read<AppSettingBloc>().toggleTheme();

// Change locale
context.read<AppSettingBloc>().changeLocale(LanguageEnum.vi);

// Check connection status
final isConnected = context.read<AppSettingBloc>().state.isConnected;
```

### 4. Listening to Changes

```dart
BlocListener<AppSettingBloc, AppSettingState>(
  listener: (context, state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
    }
  },
  child: YourWidget(),
)
```

## State Properties

- `isDarkTheme`: Boolean indicating if dark theme is enabled
- `isConnected`: Boolean indicating network connectivity status
- `locale`: Current language setting (LanguageEnum)
- `isLoading`: Boolean indicating if settings are being loaded
- `errorMessage`: String containing any error messages

## Events

- `AppSettingInitialized`: Initialize the bloc with saved settings
- `AppSettingThemeChanged(bool)`: Change theme
- `AppSettingLocaleChanged(LanguageEnum)`: Change language
- `AppSettingConnectionChanged(bool)`: Update connection status
- `AppSettingErrorOccurred(String)`: Handle errors
- `AppSettingClearError`: Clear error messages

## Example Screen

See `AppSettingsScreen` for a complete example of how to use the bloc in a settings screen.

## Dependencies

- `flutter_bloc`: State management
- `connectivity_plus`: Network monitoring
- `shared_preferences`: Persistent storage
- `equatable`: State comparison


