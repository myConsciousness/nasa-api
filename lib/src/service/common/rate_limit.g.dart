// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'rate_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RateLimit _$$_RateLimitFromJson(Map json) => $checkedCreate(
      r'_$_RateLimit',
      json,
      ($checkedConvert) {
        final val = _$_RateLimit(
          limitCount: $checkedConvert('X-RateLimit-Limit', (v) => v as int),
          remainingCount:
              $checkedConvert('X-RateLimit-Remaining', (v) => v as int),
          resetAt: $checkedConvert(
              'x-rate-limit-reset', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'limitCount': 'X-RateLimit-Limit',
        'remainingCount': 'X-RateLimit-Remaining',
        'resetAt': 'x-rate-limit-reset'
      },
    );

Map<String, dynamic> _$$_RateLimitToJson(_$_RateLimit instance) =>
    <String, dynamic>{
      'X-RateLimit-Limit': instance.limitCount,
      'X-RateLimit-Remaining': instance.remainingCount,
      'x-rate-limit-reset': instance.resetAt.toIso8601String(),
    };
