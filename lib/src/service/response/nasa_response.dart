// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/http_status.dart';
import '../common/rate_limit.dart';
import 'nasa_request.dart';

/// The class represents the response from NASA API.
class NasaResponse<D> {
  /// Returns the new instance of [NasaResponse].
  const NasaResponse({
    required this.headers,
    required this.status,
    required this.request,
    required this.rateLimit,
    required this.data,
  });

  /// The http headers
  final Map<String, String> headers;

  /// The http status
  final HttpStatus status;

  /// The request that generated this response
  final NasaRequest request;

  /// The rate limit
  final RateLimit rateLimit;

  /// The data field
  final D data;

  /// Returns the JSON representation of this response.
  ///
  /// It equals to raw JSON response from NASA.
  Map<String, dynamic> toJson() => {
        'data': data is List
            ? (data as List).map((e) => e.toJson()).toList()
            : (data as dynamic).toJson()
      };

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer();
    buffer.write('NasaResponse(');
    buffer.write('rateLimit: $rateLimit, ');
    buffer.write('data: $data, ');
    buffer.write(')');

    return buffer.toString();
  }
}
