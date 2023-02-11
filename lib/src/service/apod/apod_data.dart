// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// ignore_for_file: invalid_annotation_target

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_data.freezed.dart';
part 'apod_data.g.dart';

@freezed
class APODData with _$APODData {
  const factory APODData({
    required String title,
    @JsonKey(name: 'explanation') required String description,
    required String url,
    @JsonKey(name: 'hdurl') required String hdUrl,
    required String copyright,
    required String mediaType,
    required String serviceVersion,
    @JsonKey(name: 'date') required DateTime createdAt,
  }) = _APODData;

  factory APODData.fromJson(Map<String, Object?> json) =>
      _$APODDataFromJson(json);
}
