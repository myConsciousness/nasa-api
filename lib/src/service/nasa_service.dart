// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../core/client/client.dart';
import 'apod/apod_service.dart';

/// The class represents the NASA services.
abstract class NasaService {
  factory NasaService({
    required String token,
    required Client client,
  }) =>
      _NasaService(
        token: token,
        client: client,
      );

  /// Returns the APOD service.
  APODService get apod;
}

class _NasaService implements NasaService {
  /// Returns the new instance of [_NasaService].
  _NasaService({
    required String token,
    required Client client,
  }) : apod = APODService(
          token: token,
          client: client,
        );

  @override
  final APODService apod;
}
