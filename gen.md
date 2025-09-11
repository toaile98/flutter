### Homebrew
Works with MacOS and Linux.
```sh
$ brew install FlutterGen/tap/fluttergen
```
### Pub Global
Works with MacOS, Linux and Windows.
```sh
$ dart pub global activate flutter_gen
```
### Generate Model and State
```sh
$  flutter pub run build_runner build
```
### Generate Model and State and Delete Conflicting Outputs
```sh
$  flutter pub run build_runner build --delete-conflicting-outputs
```
### Generate localizations
```sh
$  flutter gen-l10n
```

### Generate icon
```sh
$  flutter pub run flutter_launcher_icons
```

### Build ios flavor dev
```sh
$  flutter build ios --release --flavor dev --dart-define-from-file=config/dev_env.json
```

### Build ios flavor test
```sh
$  flutter build ios --release --flavor staging --dart-define-from-file=config/flavor_staging.json
```

### Build ios flavor prod
```sh
$  flutter build ios --release --flavor prod --dart-define-from-file=config/flavor_prod.json
```

### Build apk flavor dev
```sh
$  flutter build apk --release --flavor dev --dart-define-from-file=config/dev_env.json
```

### Build apk flavor staging
```sh
$  flutter build apk --release --flavor staging --dart-define-from-file=config/flavor_staging.json
```

### Build apk flavor prod
```sh
$  flutter build apk --release --flavor prod --dart-define-from-file=config/flavor_prod.json
```

### Build app bundle flavor prod
```sh
$  flutter build appbundle --flavor prod --dart-define-from-file=config/flavor_prod.json
```

