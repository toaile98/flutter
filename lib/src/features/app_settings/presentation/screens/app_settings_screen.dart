import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_base/src/core/utils/injections.dart';
import 'package:flutter_base/src/shared/domain/entities/language_enum.dart';
import '../bloc/app_setting_bloc/app_setting_bloc.dart';
import '../bloc/app_setting_bloc/app_setting_event.dart';
import '../bloc/app_setting_bloc/app_setting_state.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppSettingBloc>()..add(const AppSettingInitialized()),
      child: const AppSettingsView(),
    );
  }
}

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
        actions: [
          BlocBuilder<AppSettingBloc, AppSettingState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<AppSettingBloc>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<AppSettingBloc, AppSettingState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    context.read<AppSettingBloc>().clearError();
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Connection Status
                _buildConnectionStatus(state.isConnected),
                SizedBox(height: 20.h),
                
                // Theme Settings
                _buildThemeSection(context, state),
                SizedBox(height: 20.h),
                
                // Language Settings
                _buildLanguageSection(context, state),
                SizedBox(height: 20.h),
                
                // Current Settings Info
                _buildCurrentSettingsInfo(state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildConnectionStatus(bool isConnected) {
    return Card(
      child: ListTile(
        leading: Icon(
          isConnected ? Icons.wifi : Icons.wifi_off,
          color: isConnected ? Colors.green : Colors.red,
        ),
        title: const Text('Network Connection'),
        subtitle: Text(
          isConnected ? 'Connected' : 'Disconnected',
          style: TextStyle(
            color: isConnected ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context, AppSettingState state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10.h),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: Text(state.isDarkTheme ? 'Dark theme enabled' : 'Light theme enabled'),
              value: state.isDarkTheme,
              onChanged: (value) {
                context.read<AppSettingBloc>().add(AppSettingThemeChanged(value));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection(BuildContext context, AppSettingState state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10.h),
            ...LanguageEnum.values.map((language) => RadioListTile<LanguageEnum>(
              title: Text(language.name.toUpperCase()),
              subtitle: Text(language.local),
              value: language,
              groupValue: state.locale,
              onChanged: (LanguageEnum? value) {
                if (value != null) {
                  context.read<AppSettingBloc>().add(AppSettingLocaleChanged(value));
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentSettingsInfo(AppSettingState state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Settings',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            _buildInfoRow('Theme', state.isDarkTheme ? 'Dark' : 'Light'),
            _buildInfoRow('Language', state.locale.name.toUpperCase()),
            _buildInfoRow('Connection', state.isConnected ? 'Connected' : 'Disconnected'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
