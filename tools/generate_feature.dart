import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Feature name is required.');
    exit(1);
  }

  final name = args[0];
  final snake =
      name
          .replaceAllMapped(
            RegExp(r'([a-z0-9])([A-Z])'),
            (m) => '${m[1]}_${m[2]}',
          )
          .toLowerCase();
  final path = 'lib/src/features/$snake';

  final structure = {
    'data/models/${snake}_model.dart': '''
import 'package:freezed_annotation/freezed_annotation.dart';

part '${snake}_model.freezed.dart';
part '${snake}_model.g.dart';

@freezed
class ${name}Model with _\$${name}Model {
  const factory ${name}Model({
    required int id,
  }) = _${name}Model;

  factory ${name}Model.fromJson(Map<String, dynamic> json) => _\$${name}ModelFromJson(json);
}
''',
    'data/datasources/remote/${snake}_datasource.dart': '''
import 'package:dio/dio.dart';

abstract class ${name}Datasource {
  Future<void> get();
}

class ${name}DatasourceImpl implements ${name}Datasource {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  ${name}DatasourceImpl(this.dio);

  @override
  Future<void> get() async {
    // TODO: Implement data fetching logic
  }
}
''',
    'data/repositories/${snake}_repository_impl.dart': '''
import '../../domain/repositories/${snake}_repository.dart';
import '../datasources/remote/${snake}_datasource.dart';

class ${name}RepositoryImpl implements ${name}Repository {
  final ${name}Datasource ${snake}Api;

  ${name}RepositoryImpl(this.${snake}Api);

  // TODO: Implement repository methods
}
''',
    'domain/entities/$snake.dart': '''
import 'package:freezed_annotation/freezed_annotation.dart';

part '${snake}.freezed.dart';

@freezed
class $name with _\$$name {
  const factory $name({
    required int id,
  }) = _${name};
}
''',
    'domain/repositories/${snake}_repository.dart': '''
abstract class ${name}Repository {
  // TODO: Define repository interface
}
''',
    'domain/usecases/get_$snake.dart': '''
import '../repositories/${snake}_repository.dart';

class Get$name {
  final ${name}Repository repository;

  Get$name(this.repository);

  // TODO: Implement usecase logic
}
''',
    'presentation/bloc/${snake}_bloc/${snake}_bloc.dart': '''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${snake}_event.dart';
part '${snake}_state.dart';
part '${snake}_bloc.freezed.dart';

class ${name}Bloc extends Bloc<${name}Event, ${name}State> {
  ${name}Bloc() : super(const ${name}State()) {
    on<_Initial>(_onInitial);
  }

  Future<void> _onInitial(
    _Initial event,
    Emitter<${name}State> emit,
  ) async {
    emit(state.copyWith(status: const ${name}Status.loading()));
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const ${name}Status.loaded()));
    } catch (e) {
      emit(state.copyWith(status: ${name}Status.error(e.toString())));
    }
  }
}
''',
    'presentation/bloc/${snake}_bloc/${snake}_event.dart': '''
part of '${snake}_bloc.dart';

@freezed
class ${name}Event with _\$${name}Event {
  const factory ${name}Event.initial() = _Initial;
}
  ''',
    'presentation/bloc/${snake}_bloc/${snake}_state.dart': '''
part of '${snake}_bloc.dart';

@freezed
class ${name}State with _\$${name}State {
  const factory ${name}State({
    @Default(${name}Status.initial()) ${name}Status status,
    String? message,
  }) = _${name}State;
}

@freezed
sealed class ${name}Status with _\$${name}Status {
  const factory ${name}Status.initial() = _InitialStatus;
  const factory ${name}Status.loading() = _LoadingStatus;
  const factory ${name}Status.loaded() = _LoadedStatus;
  const factory ${name}Status.error([String? message]) = _ErrorStatus;
}
  ''',
    'presentation/screens/${snake}_screen.dart': '''
import 'package:flutter/material.dart';

class ${name}Screen extends StatefulWidget {
  static const String routePath = '/${snake}_route_path';

  const ${name}Screen({super.key});

  @override
  State<${name}Screen> createState() => _${name}ScreenState();
}

class _${name}ScreenState extends State<${name}Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$name')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example navigation
          },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
''',
    // File init injection
    'init_${snake}_injections.dart': '''
import 'data/datasources/remote/${snake}_datasource.dart';
import 'data/repositories/${snake}_repository_impl.dart';
import 'domain/repositories/${snake}_repository.dart';
import 'domain/usecases/get_${snake}.dart';
import 'presentation/bloc/${snake}_bloc/${snake}_bloc.dart';

init${name}Injections() {
  sl.registerSingleton<${name}Datasource>(${name}DatasourceImpl(sl()));
  sl.registerSingleton<${name}Repository>(${name}RepositoryImpl(sl()));
  sl.registerSingleton<Get${name}>(Get${name}(sl()));
  sl.registerFactory<${name}Bloc>(() => ${name}Bloc());
}
''',
  };

  for (final entry in structure.entries) {
    final file = File('$path/${entry.key}');
    file.createSync(recursive: true);
    file.writeAsStringSync(entry.value.trim());
  }

  print('✅ Created $name feature with boilerplate files.');

  // 🛠 Thêm hàm init vào file injections gốc
  final injectionFile = File('lib/src/core/utils/injections.dart');
  if (!injectionFile.existsSync()) {
    print('⚠️ injections.dart not found, skipping injection update.');
    return;
  }

  String content = injectionFile.readAsStringSync();

  final callLine = 'await init${name}Injections();';
  if (!content.contains(callLine)) {
    content = content.replaceFirstMapped(
      RegExp(
        r'(Future<void> initInjections\(\) async \{)([\s\S]*?)(^\})',
        multiLine: true,
      ),
      (match) {
        final before = match.group(1)!;
        final middle = match.group(2)!;
        final after = match.group(3)!;
        return '$before$middle\n  $callLine\n$after';
      },
    );

    injectionFile.writeAsStringSync(content);
    print('✅ Added init${name}Injections() to initInjections().');
  } else {
    print('ℹ️ init${name}Injections() already exists in initInjections().');
  }
}
