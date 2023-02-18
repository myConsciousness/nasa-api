// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apod_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

APODData _$APODDataFromJson(Map<String, dynamic> json) {
  return _APODData.fromJson(json);
}

/// @nodoc
mixin _$APODData {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'explanation')
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'hdurl')
  String get hdUrl => throw _privateConstructorUsedError;
  String? get copyright => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get serviceVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $APODDataCopyWith<APODData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APODDataCopyWith<$Res> {
  factory $APODDataCopyWith(APODData value, $Res Function(APODData) then) =
      _$APODDataCopyWithImpl<$Res, APODData>;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'explanation') String description,
      String url,
      @JsonKey(name: 'hdurl') String hdUrl,
      String? copyright,
      String mediaType,
      String serviceVersion,
      @JsonKey(name: 'date') DateTime createdAt});
}

/// @nodoc
class _$APODDataCopyWithImpl<$Res, $Val extends APODData>
    implements $APODDataCopyWith<$Res> {
  _$APODDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? hdUrl = null,
    Object? copyright = freezed,
    Object? mediaType = null,
    Object? serviceVersion = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hdUrl: null == hdUrl
          ? _value.hdUrl
          : hdUrl // ignore: cast_nullable_to_non_nullable
              as String,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceVersion: null == serviceVersion
          ? _value.serviceVersion
          : serviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_APODDataCopyWith<$Res> implements $APODDataCopyWith<$Res> {
  factory _$$_APODDataCopyWith(
          _$_APODData value, $Res Function(_$_APODData) then) =
      __$$_APODDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'explanation') String description,
      String url,
      @JsonKey(name: 'hdurl') String hdUrl,
      String? copyright,
      String mediaType,
      String serviceVersion,
      @JsonKey(name: 'date') DateTime createdAt});
}

/// @nodoc
class __$$_APODDataCopyWithImpl<$Res>
    extends _$APODDataCopyWithImpl<$Res, _$_APODData>
    implements _$$_APODDataCopyWith<$Res> {
  __$$_APODDataCopyWithImpl(
      _$_APODData _value, $Res Function(_$_APODData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? hdUrl = null,
    Object? copyright = freezed,
    Object? mediaType = null,
    Object? serviceVersion = null,
    Object? createdAt = null,
  }) {
    return _then(_$_APODData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hdUrl: null == hdUrl
          ? _value.hdUrl
          : hdUrl // ignore: cast_nullable_to_non_nullable
              as String,
      copyright: freezed == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceVersion: null == serviceVersion
          ? _value.serviceVersion
          : serviceVersion // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_APODData implements _APODData {
  const _$_APODData(
      {required this.title,
      @JsonKey(name: 'explanation') required this.description,
      required this.url,
      @JsonKey(name: 'hdurl') required this.hdUrl,
      this.copyright,
      required this.mediaType,
      required this.serviceVersion,
      @JsonKey(name: 'date') required this.createdAt});

  factory _$_APODData.fromJson(Map<String, dynamic> json) =>
      _$$_APODDataFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'explanation')
  final String description;
  @override
  final String url;
  @override
  @JsonKey(name: 'hdurl')
  final String hdUrl;
  @override
  final String? copyright;
  @override
  final String mediaType;
  @override
  final String serviceVersion;
  @override
  @JsonKey(name: 'date')
  final DateTime createdAt;

  @override
  String toString() {
    return 'APODData(title: $title, description: $description, url: $url, hdUrl: $hdUrl, copyright: $copyright, mediaType: $mediaType, serviceVersion: $serviceVersion, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_APODData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hdUrl, hdUrl) || other.hdUrl == hdUrl) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.serviceVersion, serviceVersion) ||
                other.serviceVersion == serviceVersion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, url, hdUrl,
      copyright, mediaType, serviceVersion, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_APODDataCopyWith<_$_APODData> get copyWith =>
      __$$_APODDataCopyWithImpl<_$_APODData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_APODDataToJson(
      this,
    );
  }
}

abstract class _APODData implements APODData {
  const factory _APODData(
      {required final String title,
      @JsonKey(name: 'explanation') required final String description,
      required final String url,
      @JsonKey(name: 'hdurl') required final String hdUrl,
      final String? copyright,
      required final String mediaType,
      required final String serviceVersion,
      @JsonKey(name: 'date') required final DateTime createdAt}) = _$_APODData;

  factory _APODData.fromJson(Map<String, dynamic> json) = _$_APODData.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'explanation')
  String get description;
  @override
  String get url;
  @override
  @JsonKey(name: 'hdurl')
  String get hdUrl;
  @override
  String? get copyright;
  @override
  String get mediaType;
  @override
  String get serviceVersion;
  @override
  @JsonKey(name: 'date')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_APODDataCopyWith<_$_APODData> get copyWith =>
      throw _privateConstructorUsedError;
}
