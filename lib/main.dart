import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/core/helper/helper.dart';
import 'package:flutter_base/src/core/router/router.dart';
import 'package:flutter_base/src/core/styles/app_theme.dart';
import 'package:flutter_base/src/core/translations/l10n.dart';
import 'package:flutter_base/src/core/utils/injections.dart';
import 'package:flutter_base/src/features/app_settings/app_settings.dart';
import 'package:flutter_base/src/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_base/src/shared/data/data_sources/app_shared_prefs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/shared/domain/entities/language_enum.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inject all dependencies
  await initInjections();

  runApp(
    DevicePreview(
      builder: (context) {
        return const App();
      },
      enabled: false,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver, PageRouter {
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<AppSettingBloc>()),
      ],
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, appSettingState) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'Base Flutter App',
                scaffoldMessengerKey: snackBarKey,
                routerConfig: buildRouter(sl<AuthBloc>(), navigatorKey),
                theme: appSettingState.isDarkTheme ? darkAppTheme : appTheme,
                debugShowCheckedModeBanner: false,
                locale: appSettingState.localeData,
                builder: DevicePreview.appBuilder,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizationDelegate().supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
