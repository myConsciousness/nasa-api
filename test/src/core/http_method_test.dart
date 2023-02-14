// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:nasa/src/core/http_method.dart';
import 'package:test/test.dart';

void main() {
  test('.name', () {
    expect(HttpMethod.get.name, 'get');
  });

  test('.value', () {
    expect(HttpMethod.get.value, 'GET');
  });

  group('.valueOf', () {
    test('when value is supported', () {
      expect(HttpMethod.valueOf('GET'), HttpMethod.get);
    });

    test('when value is not supported', () {
      expect(
          () => HttpMethod.valueOf('TEST'), throwsA(isA<UnsupportedError>()));
    });
  });
}
