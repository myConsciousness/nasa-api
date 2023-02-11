// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:http/http.dart';

/// This exception indicates that an unexpected error occurred when
/// communicating with the NASA API.
class NasaException implements Exception {
  /// Returns the new instance of [NasaException].
  const NasaException(this.message, this.response);

  /// The error message
  final String message;

  /// The response from the NASA API.
  final Response response;

  @override
  String toString() {
    final buffer = StringBuffer()..writeln('NasaException: $message\n');

    if (response.request != null) {
      buffer
        ..writeln('  ✅ Status Code:')
        ..writeln('   ${response.statusCode}\n')
        ..writeln('  ✅ Request:')
        ..writeln('   ${response.request}\n')
        ..writeln('  ✅ Headers:')
        ..writeln('   ${response.headers}\n')
        ..writeln('  ✅ Body:')
        ..writeln('   ${response.body}\n');
    }

    buffer.writeln('  Please create an Issue if you have a question '
        'or suggestion for this exception.');

    return buffer.toString();
  }
}
