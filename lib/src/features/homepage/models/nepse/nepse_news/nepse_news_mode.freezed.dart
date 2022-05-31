// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nepse_news_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NepseNewsModel _$NepseNewsModelFromJson(Map<String, dynamic> json) {
  return _NepseNewsModel.fromJson(json);
}

/// @nodoc
class _$NepseNewsModelTearOff {
  const _$NepseNewsModelTearOff();

  _NepseNewsModel call(
      {required String title,
      required String source,
      required String link,
      required String published}) {
    return _NepseNewsModel(
      title: title,
      source: source,
      link: link,
      published: published,
    );
  }

  NepseNewsModel fromJson(Map<String, Object?> json) {
    return NepseNewsModel.fromJson(json);
  }
}

/// @nodoc
const $NepseNewsModel = _$NepseNewsModelTearOff();

/// @nodoc
mixin _$NepseNewsModel {
  String get title => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get published => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NepseNewsModelCopyWith<NepseNewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NepseNewsModelCopyWith<$Res> {
  factory $NepseNewsModelCopyWith(
          NepseNewsModel value, $Res Function(NepseNewsModel) then) =
      _$NepseNewsModelCopyWithImpl<$Res>;
  $Res call({String title, String source, String link, String published});
}

/// @nodoc
class _$NepseNewsModelCopyWithImpl<$Res>
    implements $NepseNewsModelCopyWith<$Res> {
  _$NepseNewsModelCopyWithImpl(this._value, this._then);

  final NepseNewsModel _value;
  // ignore: unused_field
  final $Res Function(NepseNewsModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? source = freezed,
    Object? link = freezed,
    Object? published = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NepseNewsModelCopyWith<$Res>
    implements $NepseNewsModelCopyWith<$Res> {
  factory _$NepseNewsModelCopyWith(
          _NepseNewsModel value, $Res Function(_NepseNewsModel) then) =
      __$NepseNewsModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, String source, String link, String published});
}

/// @nodoc
class __$NepseNewsModelCopyWithImpl<$Res>
    extends _$NepseNewsModelCopyWithImpl<$Res>
    implements _$NepseNewsModelCopyWith<$Res> {
  __$NepseNewsModelCopyWithImpl(
      _NepseNewsModel _value, $Res Function(_NepseNewsModel) _then)
      : super(_value, (v) => _then(v as _NepseNewsModel));

  @override
  _NepseNewsModel get _value => super._value as _NepseNewsModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? source = freezed,
    Object? link = freezed,
    Object? published = freezed,
  }) {
    return _then(_NepseNewsModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      published: published == freezed
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NepseNewsModel implements _NepseNewsModel {
  const _$_NepseNewsModel(
      {required this.title,
      required this.source,
      required this.link,
      required this.published});

  factory _$_NepseNewsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NepseNewsModelFromJson(json);

  @override
  final String title;
  @override
  final String source;
  @override
  final String link;
  @override
  final String published;

  @override
  String toString() {
    return 'NepseNewsModel(title: $title, source: $source, link: $link, published: $published)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NepseNewsModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.published, published) ||
                other.published == published));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, source, link, published);

  @JsonKey(ignore: true)
  @override
  _$NepseNewsModelCopyWith<_NepseNewsModel> get copyWith =>
      __$NepseNewsModelCopyWithImpl<_NepseNewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NepseNewsModelToJson(this);
  }
}

abstract class _NepseNewsModel implements NepseNewsModel {
  const factory _NepseNewsModel(
      {required String title,
      required String source,
      required String link,
      required String published}) = _$_NepseNewsModel;

  factory _NepseNewsModel.fromJson(Map<String, dynamic> json) =
      _$_NepseNewsModel.fromJson;

  @override
  String get title;
  @override
  String get source;
  @override
  String get link;
  @override
  String get published;
  @override
  @JsonKey(ignore: true)
  _$NepseNewsModelCopyWith<_NepseNewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
