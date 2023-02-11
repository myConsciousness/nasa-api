// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'apod_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_APODData _$$_APODDataFromJson(Map json) => $checkedCreate(
      r'_$_APODData',
      json,
      ($checkedConvert) {
        final val = _$_APODData(
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('explanation', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
          hdUrl: $checkedConvert('hdurl', (v) => v as String),
          copyright: $checkedConvert('copyright', (v) => v as String),
          mediaType: $checkedConvert('media_type', (v) => v as String),
          serviceVersion:
              $checkedConvert('service_version', (v) => v as String),
          createdAt:
              $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'description': 'explanation',
        'hdUrl': 'hdurl',
        'mediaType': 'media_type',
        'serviceVersion': 'service_version',
        'createdAt': 'date'
      },
    );

Map<String, dynamic> _$$_APODDataToJson(_$_APODData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'explanation': instance.description,
      'url': instance.url,
      'hdurl': instance.hdUrl,
      'copyright': instance.copyright,
      'media_type': instance.mediaType,
      'service_version': instance.serviceVersion,
      'date': instance.createdAt.toIso8601String(),
    };
