// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:http/http.dart';

// 🌎 Project imports:
import '../exception/data_not_found_exception.dart';

dynamic tryJsonDecode(
  final Response response,
) {
  try {
    return jsonDecode(response.body);
  } on FormatException {
    throw DataNotFoundException(
      'No body exists in response.',
      response,
    );
  }
}
