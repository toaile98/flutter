import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/translations/intl/messages_all.dart';
import 'package:flutter_base/src/features/app_settings/app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/translations/l10n.dart';
import '../../../../core/utils/injections.dart';
import '../../../../shared/domain/entities/language_enum.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routePath = '/unauth/login_route_path';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Example navigation
                context.read<AppSettingBloc>().changeLocale(LanguageEnum.en);
              },
              child: Text(S.delegate.supportedLocales.toString()),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  // Example navigation
                  context.read<AuthBloc>().add(AuthEvent.login());
                },
                child: Text('Login a'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Example navigation
                context.read<AppSettingBloc>().toggleTheme();
              },
              child: Text('theme'),
            ),
          ],
        ),
      ),
    );
  }
}
