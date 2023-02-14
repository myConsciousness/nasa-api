// Copyright 2023 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:nasa/nasa.dart';

Future<void> main() async {
  final nasa = NasaApi(
    token: 'YOUR_TOKEN_HERE',

    //! Automatic retry is available when server error or network error occurs
    //! when communicating with the API.
    retryConfig: RetryConfig(
      maxAttempts: 5,
      onExecute: (event) => print(
        'Retry after ${event.intervalInSeconds} seconds...'
        '[${event.retryCount} times]',
      ),
    ),

    //! The default timeout is 10 seconds.
    timeout: Duration(seconds: 20),
  );

  try {
    final apod = await nasa.apod.lookupImage();

    print(apod);
  } on UnauthorizedException catch (e) {
    print(e);
  } on RateLimitExceededException catch (e) {
    print(e);
  } on DataNotFoundException catch (e) {
    print(e);
  } on NasaException catch (e) {
    print(e);
  }
}
