import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Bloc name is required.');
    exit(1);
  }

  final blocName = args[0]; // Ví dụ: Profile
  final folderPath = args.length > 1 ? args[1] : Directory.current.path;

  final snakeCase =
      blocName
          .replaceAllMapped(
            RegExp(r'([a-z0-9])([A-Z])'),
            (m) => '${m[1]}_${m[2]}',
          )
          .toLowerCase();

  // Đường dẫn thư mục bloc
  final blocDir = Directory('$folderPath/${snakeCase}_bloc');
  if (!blocDir.existsSync()) {
    blocDir.createSync(recursive: true);
    print('📂 Created folder: ${blocDir.path}');
  }

  // Tạo file bloc
  final blocFile = File('${blocDir.path}/${snakeCase}_bloc.dart');
  blocFile.writeAsStringSync('''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${snakeCase}_event.dart';
part '${snakeCase}_state.dart';
part '${snakeCase}_bloc.freezed.dart';

class ${blocName}Bloc extends Bloc<${blocName}Event, ${blocName}State> {
  ${blocName}Bloc() : super(const ${blocName}State()) {
    on<_Initial>(_onInitial);
  }

  Future<void> _onInitial(
    _Initial event,
    Emitter<${blocName}State> emit,
  ) async {
    emit(state.copyWith(status: const ${blocName}Status.loading()));
    try {
      // TODO: Add your initial load logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: const ${blocName}Status.loaded()));
    } catch (e) {
      emit(state.copyWith(status: ${blocName}Status.error(e.toString())));
    }
  }
}
''');

  // Tạo file event
  final eventFile = File('${blocDir.path}/${snakeCase}_event.dart');
  eventFile.writeAsStringSync('''
part of '${snakeCase}_bloc.dart';

@freezed
class ${blocName}Event with _\$${blocName}Event {
  const factory ${blocName}Event.initial() = _Initial;
}
''');

  // Tạo file state
  final stateFile = File('${blocDir.path}/${snakeCase}_state.dart');
  stateFile.writeAsStringSync('''
part of '${snakeCase}_bloc.dart';

@freezed
class ${blocName}State with _\$${blocName}State {
  const factory ${blocName}State({
    @Default(${blocName}Status.initial()) ${blocName}Status status,
    String? message,
  }) = _${blocName}State;
}

@freezed
sealed class ${blocName}Status with _\$${blocName}Status {
  const factory ${blocName}Status.initial() = _InitialStatus;
  const factory ${blocName}Status.loading() = _LoadingStatus;
  const factory ${blocName}Status.loaded() = _LoadedStatus;
  const factory ${blocName}Status.error([String? message]) = _ErrorStatus;
}
''');

  print('✅ Created BLoC files for $blocName');
}
