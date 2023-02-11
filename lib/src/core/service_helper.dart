// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'client/client.dart';
import 'serializable.dart';

abstract class Service {
  Future<http.Response> get(
    String unencodedPath, {
    http.Response Function(http.Response response)? validate,
  });
}

class ServiceHelper implements Service {
  /// Returns the new instance of [ServiceHelper].
  const ServiceHelper({
    required String authority,
    required Client client,
  })  : _authority = authority,
        _client = client;

  /// The base url
  final String _authority;

  /// The NASA client
  final Client _client;

  @override
  Future<http.Response> get(
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    http.Response Function(http.Response response)? validate,
  }) async {
    final response = await _client.get(
      Uri.https(
        _authority,
        unencodedPath,
        _convertQueryParameters(queryParameters),
      ),
    );

    return validate != null ? validate(response) : response;
  }

  dynamic _removeNullValues(final dynamic object) {
    if (object is Map) {
      final parameters = <String, dynamic>{};
      object.forEach((key, value) {
        final newObject = _removeNullValues(value);

        if (newObject != null) {
          parameters[key] = newObject;
        }
      });

      return parameters.isNotEmpty ? parameters : null;
    } else if (object is List) {
      final parameters = <dynamic>[];
      for (final value in object) {
        final newObject = _removeNullValues(value);

        if (newObject != null) {
          parameters.add(newObject);
        }
      }

      return parameters.isNotEmpty ? parameters : null;
    }

    //! Just return it as is if it's neither Map nor List.
    return object;
  }

  Map<String, String> _convertQueryParameters(
    final Map<String, dynamic> queryParameters,
  ) {
    final serializedParameters = queryParameters.map((key, value) {
      if (value is List<Serializable>?) {
        return MapEntry(
          key,
          value?.toSet().map((e) => e.value).toList().join(','),
        );
      } else if (value is List<Enum>?) {
        return MapEntry(
          key,
          value?.toSet().map((e) => e.name).join(','),
        );
      } else if (value is List?) {
        return MapEntry(
          key,
          value?.toSet().join(','),
        );
      } else if (value is Serializable) {
        return MapEntry(
          key,
          value.value,
        );
      }

      return MapEntry(key, value);
    });

    return Map.from(_removeNullValues(serializedParameters) ?? {}).map(
      //! Uri.https(...) needs iterable in the value for query params by
      //! which it means a String in the value of the Map too. So you need
      //! to convert it from Map<String, dynamic> to Map<String, String>
      (key, value) {
        if (value is DateTime) {
          return MapEntry(key, value.toUtc().toIso8601String());
        }

        return MapEntry(key, value.toString());
      },
    );
  }
}
