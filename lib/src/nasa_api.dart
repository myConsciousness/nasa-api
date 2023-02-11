// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'core/client/client.dart';
import 'core/config/retry_config.dart';
import 'service/apod/apod_service.dart';
import 'service/nasa_service.dart';

/// This class represents `NASA API`.
///
/// ## Supported Services
///
/// - APOD service: [apod]
///
/// ## Exceptions
///
/// The following exceptions may be thrown by this object.
///
/// - [TimeoutException](https://api.dart.dev/stable/2.17.6/dart-async/TimeoutException-class.html): If the request takes longer than the specified timeout.
/// - [UnauthorizedException](https://pub.dev/documentation/nasa_api/latest/nasa_api/UnauthorizedException-class.html): When the access token is invalid.
/// - [RateLimitExceededException](https://pub.dev/documentation/nasa_api/latest/nasa_api/RateLimitExceededException-class.html): When the rate limit is exceeded.
/// - [DataNotFoundException](https://pub.dev/documentation/nasa_api/latest/nasa_api/DataNotFoundException-class.html): When response has no body or data field.
/// - [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html): When the response body is not a valid JSON and etc.
///
/// ## More Information
///
/// You can see more information from the following links:
///
/// - [Repository](https://github.com/myConsciousness/nasa-api)
/// - [README](https://github.com/myConsciousness/nasa-api/blob/main/README.md)
abstract class NasaApi {
  /// Returns the new instance of [NasaApi].
  factory NasaApi({
    required String token,
    Duration timeout = const Duration(seconds: 10),
    RetryConfig? retryConfig,
  }) =>
      _NasaApi(
        token: token,
        timeout: timeout,
        retryConfig: retryConfig,
      );

  /// Returns the APOD service.
  APODService get apod;
}

class _NasaApi implements NasaApi {
  _NasaApi({
    required String token,
    required Duration timeout,
    RetryConfig? retryConfig,
  }) : _nasaService = NasaService(
          token: token,
          client: Client(
            timeout: timeout,
            retryConfig: retryConfig,
          ),
        );

  /// The NASA service
  final NasaService _nasaService;

  @override
  APODService get apod => _nasaService.apod;
}
