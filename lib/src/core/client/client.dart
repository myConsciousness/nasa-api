// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

// 🌎 Project imports:
import '../config/retry_config.dart';
import 'retry_policy.dart';

abstract class Client {
  /// Returns the new instance of [Client].
  factory Client({
    required Duration timeout,
    RetryConfig? retryConfig,
  }) =>
      _Client(
        timeout: timeout,
        retryConfig: retryConfig,
      );

  Future<http.Response> get(final Uri uri);
}

class _Client implements Client {
  /// Returns the new instance of [_Client].
  _Client({
    required this.timeout,
    RetryConfig? retryConfig,
  }) : _retryPolicy = RetryPolicy(retryConfig);

  /// The timeout duration.
  final Duration timeout;

  /// The policy for retry.
  final RetryPolicy _retryPolicy;

  @override
  Future<http.Response> get(final Uri uri) async =>
      await http.get(uri).timeout(timeout);

  dynamic _challengeWithRetryIfNecessary(
    final Client client,
    final dynamic Function(Client client) challenge, {
    int retryCount = 0,
  }) async {
    try {
      final response = await challenge.call(client);

      if (response.statusCode == 500 || response.statusCode == 503) {
        if (_retryPolicy.shouldRetry(retryCount)) {
          return await _retry(client, challenge, retryCount: ++retryCount);
        }
      }

      return response;
    } on SocketException {
      if (_retryPolicy.shouldRetry(retryCount)) {
        return await _retry(client, challenge, retryCount: ++retryCount);
      }

      rethrow;
    } on TimeoutException {
      if (_retryPolicy.shouldRetry(retryCount)) {
        return await _retry(client, challenge, retryCount: ++retryCount);
      }

      rethrow;
    }
  }

  dynamic _retry(
    final Client client,
    final dynamic Function(Client client) challenge, {
    int retryCount = 0,
  }) async {
    await _retryPolicy.wait(retryCount);

    return await _challengeWithRetryIfNecessary(
      client,
      challenge,
      retryCount: retryCount,
    );
  }
}
