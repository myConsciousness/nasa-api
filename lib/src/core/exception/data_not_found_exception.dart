// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import 'nasa_exception.dart';

/// This object is thrown to indicate that the data associated with
/// a particular condition does not exist on Nasa's server.
class DataNotFoundException extends NasaException {
  /// Returns the new instance of [DataNotFoundException].
  DataNotFoundException(super.message, super.response);

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('DataNotFoundException: $message\n')
      ..writeln('  ✅ Status Code:')
      ..writeln('   ${response.statusCode}\n')
      ..writeln('  ✅ Request:')
      ..writeln('   ${response.request}\n')
      ..writeln('  ✅ Headers:')
      ..writeln('   ${response.headers}\n')
      ..writeln('  ✅ Body:')
      ..writeln('   ${response.body}\n');

    buffer.writeln('  Please create an Issue if you have a question '
        'or suggestion for this exception.');

    return buffer.toString();
  }
}
