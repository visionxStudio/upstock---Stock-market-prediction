// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyListModel _$CompanyListModelFromJson(Map<String, dynamic> json) {
  return _CompanyListModel.fromJson(json);
}

/// @nodoc
class _$CompanyListModelTearOff {
  const _$CompanyListModelTearOff();

  _CompanyListModel call({required List<CompanyModel> data}) {
    return _CompanyListModel(
      data: data,
    );
  }

  CompanyListModel fromJson(Map<String, Object?> json) {
    return CompanyListModel.fromJson(json);
  }
}

/// @nodoc
const $CompanyListModel = _$CompanyListModelTearOff();

/// @nodoc
mixin _$CompanyListModel {
  List<CompanyModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyListModelCopyWith<CompanyListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyListModelCopyWith<$Res> {
  factory $CompanyListModelCopyWith(
          CompanyListModel value, $Res Function(CompanyListModel) then) =
      _$CompanyListModelCopyWithImpl<$Res>;
  $Res call({List<CompanyModel> data});
}

/// @nodoc
class _$CompanyListModelCopyWithImpl<$Res>
    implements $CompanyListModelCopyWith<$Res> {
  _$CompanyListModelCopyWithImpl(this._value, this._then);

  final CompanyListModel _value;
  // ignore: unused_field
  final $Res Function(CompanyListModel) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CompanyModel>,
    ));
  }
}

/// @nodoc
abstract class _$CompanyListModelCopyWith<$Res>
    implements $CompanyListModelCopyWith<$Res> {
  factory _$CompanyListModelCopyWith(
          _CompanyListModel value, $Res Function(_CompanyListModel) then) =
      __$CompanyListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<CompanyModel> data});
}

/// @nodoc
class __$CompanyListModelCopyWithImpl<$Res>
    extends _$CompanyListModelCopyWithImpl<$Res>
    implements _$CompanyListModelCopyWith<$Res> {
  __$CompanyListModelCopyWithImpl(
      _CompanyListModel _value, $Res Function(_CompanyListModel) _then)
      : super(_value, (v) => _then(v as _CompanyListModel));

  @override
  _CompanyListModel get _value => super._value as _CompanyListModel;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_CompanyListModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CompanyModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyListModel implements _CompanyListModel {
  const _$_CompanyListModel({required this.data});

  factory _$_CompanyListModel.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyListModelFromJson(json);

  @override
  final List<CompanyModel> data;

  @override
  String toString() {
    return 'CompanyListModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$CompanyListModelCopyWith<_CompanyListModel> get copyWith =>
      __$CompanyListModelCopyWithImpl<_CompanyListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyListModelToJson(this);
  }
}

abstract class _CompanyListModel implements CompanyListModel {
  const factory _CompanyListModel({required List<CompanyModel> data}) =
      _$_CompanyListModel;

  factory _CompanyListModel.fromJson(Map<String, dynamic> json) =
      _$_CompanyListModel.fromJson;

  @override
  List<CompanyModel> get data;
  @override
  @JsonKey(ignore: true)
  _$CompanyListModelCopyWith<_CompanyListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
