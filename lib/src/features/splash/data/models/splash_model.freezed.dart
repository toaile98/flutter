// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SplashModel _$SplashModelFromJson(Map<String, dynamic> json) {
  return _SplashModel.fromJson(json);
}

/// @nodoc
mixin _$SplashModel {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this SplashModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashModelCopyWith<SplashModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashModelCopyWith<$Res> {
  factory $SplashModelCopyWith(
    SplashModel value,
    $Res Function(SplashModel) then,
  ) = _$SplashModelCopyWithImpl<$Res, SplashModel>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$SplashModelCopyWithImpl<$Res, $Val extends SplashModel>
    implements $SplashModelCopyWith<$Res> {
  _$SplashModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashModel
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
abstract class _$$SplashModelImplCopyWith<$Res>
    implements $SplashModelCopyWith<$Res> {
  factory _$$SplashModelImplCopyWith(
    _$SplashModelImpl value,
    $Res Function(_$SplashModelImpl) then,
  ) = __$$SplashModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SplashModelImplCopyWithImpl<$Res>
    extends _$SplashModelCopyWithImpl<$Res, _$SplashModelImpl>
    implements _$$SplashModelImplCopyWith<$Res> {
  __$$SplashModelImplCopyWithImpl(
    _$SplashModelImpl _value,
    $Res Function(_$SplashModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$SplashModelImpl(
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
@JsonSerializable()
class _$SplashModelImpl implements _SplashModel {
  const _$SplashModelImpl({required this.id});

  factory _$SplashModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashModelImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'SplashModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SplashModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashModelImplCopyWith<_$SplashModelImpl> get copyWith =>
      __$$SplashModelImplCopyWithImpl<_$SplashModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashModelImplToJson(this);
  }
}

abstract class _SplashModel implements SplashModel {
  const factory _SplashModel({required final int id}) = _$SplashModelImpl;

  factory _SplashModel.fromJson(Map<String, dynamic> json) =
      _$SplashModelImpl.fromJson;

  @override
  int get id;

  /// Create a copy of SplashModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashModelImplCopyWith<_$SplashModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
