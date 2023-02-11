// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🌎 Project imports:
import '../../core/client/client.dart';
import '../base_service.dart';
import '../response/nasa_response.dart';
import 'apod_data.dart';

abstract class APODService {
  /// Returns the new instance of [APODService].
  factory APODService({
    required String token,
    required Client client,
  }) =>
      _APODService(
        token: token,
        authority: 'api.nasa.gov',
        client: client,
      );

  Future<NasaResponse<APODData>> lookupImage();
}

class _APODService extends BaseService implements APODService {
  /// Returns the new instance of [_APODService].
  _APODService({
    required super.token,
    required super.authority,
    required super.client,
  });

  @override
  Future<NasaResponse<APODData>> lookupImage() async =>
      super.transformSingleDataResponse(
        await super.get(
          '/planetary/apod',
          queryParameters: {
            'api_key': token,
          },
        ),
        dataBuilder: APODData.fromJson,
      );
}
