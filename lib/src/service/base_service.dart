// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import '../core/client/client.dart';
import '../core/exception/data_not_found_exception.dart';
import '../core/exception/rate_limit_exceeded_exception.dart';
import '../core/exception/unauthorized_exception.dart';
import '../core/http_method.dart';
import '../core/http_status.dart';
import '../core/service_helper.dart';
import '../core/util/json_utils.dart';
import 'common/rate_limit.dart';
import 'response/nasa_request.dart';
import 'response/nasa_response.dart';

/// The callback function for building data object from response.
typedef DataBuilder<D> = D Function(Map<String, Object?> json);

abstract class _Service {
  Future<http.Response> get(
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  });

  NasaResponse<D> transformSingleDataResponse<D>(
    http.Response response, {
    required DataBuilder<D> dataBuilder,
  });

  NasaResponse<List<D>> transformMultiDataResponse<D>(
    http.Response response, {
    required DataBuilder<D> dataBuilder,
  });
}

abstract class BaseService implements _Service {
  /// Returns the new instance of [BaseService].
  BaseService({
    required this.token,
    required String authority,
    required Client client,
  }) : _helper = ServiceHelper(
          authority: authority,
          client: client,
        );

  final String token;

  final ServiceHelper _helper;

  final _RateLimitConverter _rateLimitConverter = const _RateLimitConverter();

  @override
  Future<http.Response> get(
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  }) async =>
      await _helper.get(
        unencodedPath,
        queryParameters: queryParameters,
        validate: _checkGetResponse,
      );

  @override
  NasaResponse<D> transformSingleDataResponse<D>(
    http.Response response, {
    required DataBuilder<D> dataBuilder,
  }) {
    final jsonBody = tryJsonDecode(response);

    return NasaResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: NasaRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        _rateLimitConverter.convert(response.headers),
      ),
      data: dataBuilder(jsonBody),
    );
  }

  @override
  NasaResponse<List<D>> transformMultiDataResponse<D>(
    http.Response response, {
    required DataBuilder<D> dataBuilder,
  }) {
    final jsonBody = tryJsonDecode(response);

    return NasaResponse(
      headers: response.headers,
      status: HttpStatus.valueOf(response.statusCode),
      request: NasaRequest(
        method: HttpMethod.valueOf(response.request!.method),
        url: response.request!.url,
      ),
      rateLimit: RateLimit.fromJson(
        _rateLimitConverter.convert(response.headers),
      ),
      data: jsonBody.isNotEmpty
          ? jsonBody.map<D>((json) => dataBuilder(json)).toList()
          : [],
    );
  }

  http.Response _checkGetResponse(final http.Response response) {
    if (HttpStatus.unauthorized.equalsByCode(response.statusCode)) {
      throw UnauthorizedException(
        'The specified access token is invalid.',
        response,
      );
    }

    if (HttpStatus.notFound.equalsByCode(response.statusCode)) {
      throw DataNotFoundException(
        'No data exists in response.',
        response,
      );
    }

    if (HttpStatus.tooManyRequests.equalsByCode(response.statusCode)) {
      throw RateLimitExceededException(
        'Rate limit exceeded.',
        response,
      );
    }

    tryJsonDecode(response);

    return response;
  }
}

class _RateLimitConverter {
  /// Returns the new instance of [_RateLimitConverter].
  const _RateLimitConverter();

  Map<String, dynamic> convert(final Map<String, String> input) => {
        //! Although it rarely occurs, there is a case where the header does not
        //! contain rate limiting information.
        'X-RateLimit-Limit': _getInt(input, 'X-RateLimit-Limit'),
        'X-RateLimit-Remaining': _getInt(input, 'X-RateLimit-Remaining'),
        'x-rate-limit-reset': _getDateTimeString(input, 'x-rate-limit-reset'),
      };

  int _getInt(final Map<String, String> input, final String key) =>
      input.containsKey(key) ? int.parse(input[key]!) : 0;

  String _getDateTimeString(final Map<String, String> input, final String key) {
    if (!input.containsKey(key)) {
      return DateTime.fromMillisecondsSinceEpoch(0).toString();
    }

    return DateTime.fromMillisecondsSinceEpoch(
      int.parse(input[key]!) * 1000,
    ).toString();
  }
}
