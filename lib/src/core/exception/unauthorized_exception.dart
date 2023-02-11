// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'nasa_exception.dart';

/// This exception is thrown to indicate that the specified access token was not
/// authorized by the server as a result of its use in the request.
class UnauthorizedException extends NasaException {
  /// Returns the new instance of [UnauthorizedException].
  const UnauthorizedException(
    super.message,
    super.response,
  );

  @override
  String toString() {
    final buffer = StringBuffer()..writeln('UnauthorizedException: $message\n');

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
