// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'mock.mocks.dart';

MockClient buildGetStub(
  final String authority,
  final String unencodedPath,
  final String resourcePath,
  final Map<String, String> queryParameters, {
  int statusCode = 200,
}) {
  final mockClient = MockClient();

  when(mockClient.get(
    Uri.https(authority, unencodedPath, queryParameters),
  )).thenAnswer(
    (_) async => Response(
      await File(resourcePath).readAsString(),
      statusCode,
      headers: {'content-type': 'application/json; charset=utf-8'},
      request: Request('GET', Uri()),
    ),
  );

  return mockClient;
}
