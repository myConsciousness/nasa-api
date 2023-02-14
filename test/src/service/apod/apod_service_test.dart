// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:nasa_api/src/core/exception/unauthorized_exception.dart';
import 'package:nasa_api/src/service/apod/apod_data.dart';
import 'package:nasa_api/src/service/apod/apod_service.dart';
import 'package:nasa_api/src/service/response/nasa_response.dart';
import 'package:test/test.dart';

import '../../../mock/client_stubs.dart';

void main() {
  group('.lookupImage', () {
    test('normal case', () async {
      final apod = APODService(
        token: 'test',
        client: buildGetStub(
          'api.nasa.gov',
          '/planetary/apod',
          'test/src/service/apod/data/lookup_image.json',
          {
            'api_key': 'test',
          },
        ),
      );

      final response = await apod.lookupImage();

      expect(response, isA<NasaResponse>());
      expect(response.data, isA<APODData>());

      expect(response.data.copyright, 'Felipe Mac Auliffe L\u00f3pez');
      expect(response.data.createdAt, DateTime(2023, 2, 11));
      expect(
          response.data.description,
          'The two prominent clouds in this Chilean Atacama Desert skyscape '
          'captured on January 21 actually lie beyond our Milky Way galaxy.  '
          'Known as the Large and the Small Magellanic Clouds they are so '
          'named for the 16th century Portuguese explorer Ferdinand Magellan, '
          'leader of the first circumnavigation of planet Earth. Famous '
          'jewels of southern hemisphere skies, they are the brightest '
          'satellite galaxies of the Milky Way. The larger cloud is some '
          '160,000 light-years, and the smaller 210,000 light-years distant. '
          'While both are irregular dwarf galaxies in their own right, they '
          'exhibit central barred structures in the deep wide-angle view. '
          'Wide and deep exposures also reveal faint dusty galactic cirrus '
          'nebulae and the imprints of gravitational tidal interactions '
          'between the Large and Small Magellanic Clouds.');
      expect(response.data.hdUrl,
          'https://apod.nasa.gov/apod/image/2302/magellanic.jpg');
      expect(response.data.url,
          'https://apod.nasa.gov/apod/image/2302/magellanic1200.jpg');
      expect(response.data.mediaType, 'image');
      expect(response.data.serviceVersion, 'v1');
      expect(response.data.title, 'Magellanic Clouds over Chile');
    });

    test('when unauthorized', () async {
      final apod = APODService(
        token: 'test',
        client: buildGetStub(
          'api.nasa.gov',
          '/planetary/apod',
          'test/src/service/apod/data/lookup_image.json',
          {
            'api_key': 'test',
          },
          statusCode: 401,
        ),
      );

      expect(() async => await apod.lookupImage(),
          throwsA(isA<UnauthorizedException>()));
    });
  });
}
