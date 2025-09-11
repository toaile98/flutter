// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Splash {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashCopyWith<Splash> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashCopyWith<$Res> {
  factory $SplashCopyWith(Splash value, $Res Function(Splash) then) =
      _$SplashCopyWithImpl<$Res, Splash>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$SplashCopyWithImpl<$Res, $Val extends Splash>
    implements $SplashCopyWith<$Res> {
  _$SplashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SplashImplCopyWith<$Res> implements $SplashCopyWith<$Res> {
  factory _$$SplashImplCopyWith(
    _$SplashImpl value,
    $Res Function(_$SplashImpl) then,
  ) = __$$SplashImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SplashImplCopyWithImpl<$Res>
    extends _$SplashCopyWithImpl<$Res, _$SplashImpl>
    implements _$$SplashImplCopyWith<$Res> {
  __$$SplashImplCopyWithImpl(
    _$SplashImpl _value,
    $Res Function(_$SplashImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$SplashImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$SplashImpl implements _Splash {
  const _$SplashImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'Splash(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashImplCopyWith<_$SplashImpl> get copyWith =>
      __$$SplashImplCopyWithImpl<_$SplashImpl>(this, _$identity);
}

abstract class _Splash implements Splash {
  const factory _Splash({required final int id}) = _$SplashImpl;

  @override
  int get id;

  /// Create a copy of Splash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashImplCopyWith<_$SplashImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
