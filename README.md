<p align="center">
  <a href="https://github.com/myConsciousness/nasa-api">
    <img alt="nasa_api" width="600px" src="">
  </a>
</p>

<p align="center">
  <b>The easiest and powerful Dart/Flutter library for NASA APIs 🌎</b>
</p>

---

[![GitHub Sponsor](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=ff69b4)](https://github.com/sponsors/myConsciousness)
[![GitHub Sponsor](https://img.shields.io/static/v1?label=Maintainer&message=myConsciousness&logo=GitHub&color=00acee)](https://github.com/myConsciousness)

[![pub package](https://img.shields.io/pub/v/nasa_api.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/nasa_api)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/nasa_api)](https://pub.dev/packages/nasa_api/)
[![Test](https://github.com/myConsciousness/nasa-api/actions/workflows/test.yml/badge.svg)](https://github.com/myConsciousness/nasa-api/actions/workflows/test.yml)
[![Analyzer](https://github.com/myConsciousness/nasa-api/actions/workflows/analyzer.yml/badge.svg)](https://github.com/myConsciousness/nasa-api/actions/workflows/analyzer.yml)
[![codecov](https://codecov.io/gh/myConsciousness/nasa-api/branch/main/graph/badge.svg?token=J5GT1PF9Y3)](https://codecov.io/gh/myConsciousness/nasa-api)
[![Issues](https://img.shields.io/github/issues/myConsciousness/nasa-api?logo=github&logoColor=white)](https://github.com/myConsciousness/nasa-api/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/myConsciousness/nasa-api?logo=github&logoColor=white)](https://github.com/myConsciousness/nasa-api/pulls)
[![Stars](https://img.shields.io/github/stars/myConsciousness/nasa-api?logo=github&logoColor=white)](https://github.com/myConsciousness/nasa-api)
[![Contributors](https://img.shields.io/github/contributors/myConsciousness/nasa-api)](https://github.com/myConsciousness/nasa-api/graphs/contributors)
[![Code size](https://img.shields.io/github/languages/code-size/myConsciousness/nasa-api?logo=github&logoColor=white)](https://github.com/myConsciousness/nasa-api)
[![Last Commits](https://img.shields.io/github/last-commit/myConsciousness/nasa-api?logo=git&logoColor=white)](https://github.com/myConsciousness/nasa-api/commits/main)
[![License](https://img.shields.io/github/license/myConsciousness/nasa-api?logo=open-source-initiative&logoColor=green)](https://github.com/myConsciousness/nasa-api/blob/main/LICENSE)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://github.com/myConsciousness/nasa-api/blob/main/CODE_OF_CONDUCT.md)

---

<!-- TOC -->

- [1. Guide 🌎](#1-guide-)
  - [1.1. Features 💎](#11-features-)
  - [1.2. Getting Started ⚡](#12-getting-started-)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import](#122-import)
    - [1.2.3. Implementation](#123-implementation)
  - [1.3. Supported Endpoints 👀](#13-supported-endpoints-)
    - [1.3.1. APOD Service](#131-apod-service)
  - [1.4. Tips 🏄](#14-tips-)
    - [1.4.1. Method Names](#141-method-names)
    - [1.4.2. Null Parameter at Request](#142-null-parameter-at-request)
    - [1.4.3. JSON Serialization and Deserialization](#143-json-serialization-and-deserialization)
    - [1.4.4. Change the Timeout Duration](#144-change-the-timeout-duration)
    - [1.4.5. Automatic Retry](#145-automatic-retry)
      - [1.4.5.1. Exponential BackOff and Jitter](#1451-exponential-backoff-and-jitter)
      - [1.4.5.2. Do Something on Retry](#1452-do-something-on-retry)
    - [1.4.6. Thrown Exceptions](#146-thrown-exceptions)
  - [1.5. Contribution 🏆](#15-contribution-)
  - [1.6. Contributors](#16-contributors)
  - [1.7. Support ❤️](#17-support-️)
  - [1.8. License 🔑](#18-license-)
  - [1.9. More Information 🧐](#19-more-information-)

<!-- /TOC -->

# 1. Guide 🌎

This library provides the easiest way to use [NASA APIs](https://api.nasa.gov) in **Dart** and **Flutter** apps.

**Show some ❤️ and star the repo to support the project.**

## 1.1. Features 💎

✅ The **wrapper library** for **[NASA APIs](https://api.nasa.gov)**. </br>
✅ **Easily integrates** with the **Dart** & **Flutter** apps. </br>
✅ Provides response objects with a **guaranteed safe types.** </br>
✅ Support **all request parameters and response fields**.</br>
✅ **Well documented** and **well tested**.</br>
✅ Supports the powerful **automatic retry**.</br>

## 1.2. Getting Started ⚡

### 1.2.1. Install Library

**With Dart:**

```bash
 dart pub add nasa_api
```

**Or With Flutter:**

```bash
 flutter pub add nasa_api
```

### 1.2.2. Import

```dart
import 'package:nasa_api/nasa_api.dart';
```

### 1.2.3. Implementation

```dart
import 'package:nasa_api/nasa_api.dart';

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
```

## 1.3. Supported Endpoints 👀

### 1.3.1. APOD Service

| Endpoint                                                              | Method Name                                                                                        |
| --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| [GET https://api.nasa.gov/planetary/apod](https://api.nasa.gov/#apod) | [lookupImage](https://pub.dev/documentation/nasa_api/latest/nasa_api/APODService/lookupImage.html) |

## 1.4. Tips 🏄

### 1.4.1. Method Names

**nasa_api** uses the following standard prefixes depending on endpoint characteristics. So it's very easy to find the method corresponding to the endpoint you want to use!

| Prefix     | Description                                                              |
| ---------- | ------------------------------------------------------------------------ |
| **lookup** | This prefix is attached to endpoints that reference specific images etc. |
| **search** | This prefix is attached to endpoints that perform extensive searches.    |

### 1.4.2. Null Parameter at Request

In this library, parameters that are not required at request time, i.e., optional parameters, are defined as nullable.
However, developers do not need to be aware of the null parameter when sending requests when using this library.

It means the parameters specified with a null value are safely removed and ignored before the request is sent.

For example, arguments specified with null are ignored in the following request.

### 1.4.3. JSON Serialization and Deserialization

All NASA API responses obtained using **nasa_api** are returned stored in a safe type object. However, there may be cases where the raw JSON returned from the NASA API is needed when creating applications in combination with other libraries.

In that case, you can use the **`toJson`** method provided by the `NasaResponse` or other model objects to convert it to the raw JSON format returned by the NASA API.

The JSON converted by this **`toJson`** method is **completely equivalent to the JSON returned by the NASA API** and can be deserialized by using the factory constructor **`fromJson`** provided with each model object.

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() async {
  final nasa = NasaApi(token: 'YOUR_TOKEN');

  try {
    final response = await nasa.apod.lookupImage();

    //! You can get raw JSON from this response.
    print(response.toJson());

    //! Or you can get raw JSON from specific model object.
    print(response.data.first.toJson());
  } on NasaException catch (e) {
    print(e);
  }
}
```

You could also write like:

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() async {
  final nasa = NasaApi(token: 'YOUR_TOKEN');

  try {
    final response = await nasa.apod.lookupImage();

    //! Serialize & Deserialize
    final json = response.data.toJson();
    final apod = APODData.fromJson(json);

    print(apod);
  } on NasaException catch (e) {
    print(e);
  }
}
```

### 1.4.4. Change the Timeout Duration

The library specifies a default timeout of **10 seconds** for all API communications.

However, there may be times when you wish to specify an arbitrary timeout duration. If there is such a demand, an arbitrary timeout duration can be specified as follows.

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() {
 final nasa = NasaApi(
    token: 'YOUR_TOKEN_HERE',

    //! The default timeout is 10 seconds.
    timeout: Duration(seconds: 5),
  );
}
```

### 1.4.5. Automatic Retry

Due to the nature of this library's communication with external systems, timeouts may occur due to inevitable communication failures or temporary crashes of the server to which requests are sent.

When such timeouts occur, an effective countermeasure in many cases is to send the request again after a certain interval. And **nasa_api** provides an **automatic retry** feature as a solution to this problem.

The errors subject to retry are as follows.

- When the status code of the response returned from NASA is `500` or `503`.
- When the network is temporarily lost and `SocketException` is thrown.
- When communication times out temporarily and `TimeoutException` is thrown

#### 1.4.5.1. Exponential BackOff and Jitter

The easiest way to perform an automatic retry is to stop the process at a certain time and rerun it until it succeeds. However, if there is a network outage on NASA's servers, sending multiple requests to a specific server at the same time may further overload the server to which the request is sent and further reduce the success rate of retry attempts.

This problem can be solved by exponential number and adding a random number called **Jitter**, and this method is called the **Exponential BackOff and Jitter** algorithm. By adding a random number to the exponentially increasing retry interval, the retry interval can be distributed more flexibly.

It can be implemented as follows.

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() async {
  final nasa = NasaApi(
    token: 'YOUR_TOKEN_HERE',

    //! Add these lines.
    retryConfig: RetryConfig(
      maxAttempts: 3,
    ),
  );
}
```

In the above implementation, the interval increases exponentially for each retry count with jitter. It can be expressed by next formula.

> **(2 ^ retryCount) + jitter(Random Number between 0 ~ 3)**

#### 1.4.5.2. Do Something on Retry

It would be useful to output logging on retries and a popup notifying the user that a retry has been executed. So **nasa_api** provides callbacks that can perform arbitrary processing when retries are executed.

It can be implemented as follows.

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() async {
  final nasa = NasaApi(
    token: 'YOUR_TOKEN_HERE',

    retryConfig: RetryConfig(
      maxAttempts: 3,

      //! Add this line.
      onExecute: (event) => print('Retrying... ${event.retryCount} times.'),
    ),
  );
}
```

The [RetryEvent](https://pub.dev/documentation/nasa_api/latest/nasa_api/RetryEvent-class.html) passed to the callback contains information on retries.

### 1.4.6. Thrown Exceptions

**nasa_api** provides a convenient exception object for easy handling of exceptional responses and errors returned from [NASA API](https://developer.NASA.com/en/docs/NASA-api/data-dictionary/introduction).

| Exception                                                                                                                  | Description                                                       |
| -------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html)                           | The most basic exception object. For example                      |
| [UnauthorizedException](https://pub.dev/documentation/nasa_api/latest/nasa_api/UnauthorizedException-class.html)           | Thrown when authentication fails with the specified access token. |
| [RateLimitExceededException](https://pub.dev/documentation/nasa_api/latest/nasa_api/RateLimitExceededException-class.html) | Thrown when the request rate limit is exceeded.                   |
| [DataNotFoundException](https://pub.dev/documentation/nasa_api/latest/nasa_api/DataNotFoundException-class.html)           | Thrown when response has no body or data field in body string.    |

Also, all of the above exceptions thrown from the **nasa_api** process extend [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html). This means that you can take all exceptions as [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html) or handle them as certain exception types, depending on the situation.

However note that, if you receive an individual type exception, be sure to define the process so that the individual exception type is cached before [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html). Otherwise, certain type exceptions will also be caught as [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html).

Therefore, if you need to catch a specific type of exception in addition to [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html), be sure to catch [NasaException](https://pub.dev/documentation/nasa_api/latest/nasa_api/NasaException-class.html) in the bottom catch clause as in the following example.

```dart
import 'package:nasa_api/nasa_api.dart';

Future<void> main() async {
  final nasa = NasaApi(token: 'YOUR_TOKEN_HERE');

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
```

## 1.5. Contribution 🏆

If you would like to contribute to **nasa_api**, please create an [issue](https://github.com/myConsciousness/nasa-api/issues) or create a Pull Request.

There are many ways to contribute to the OSS. For example, the following subjects can be considered:

- There are request parameters or response fields that are not implemented.
- Documentation is outdated or incomplete.
- Have a better way or idea to achieve the functionality.
- etc...

You can see more details from resources below:

- [Contributor Covenant Code of Conduct](https://github.com/myConsciousness/nasa-api/blob/main/CODE_OF_CONDUCT.md)
- [Contribution Guidelines](https://github.com/myConsciousness/nasa-api/blob/main/CONTRIBUTING.md)
- [Style Guide](https://github.com/myConsciousness/nasa-api/blob/main/STYLEGUIDE.md)

Or you can create a [discussion](https://github.com/myConsciousness/nasa-api/discussions) if you like.

**Feel free to join this development, diverse opinions make software better!**

## 1.6. Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## 1.7. Support ❤️

The simplest way to show us your support is by **giving the project a star** at [GitHub](https://github.com/myConsciousness/nasa-api) and [Pub.dev](https://pub.dev/packages/nasa_api).

You can also support this project by **becoming a sponsor** on GitHub:

<div align="left">
  <p>
    <a href="https://github.com/sponsors/myconsciousness">
      <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="myconsciousness" />
    </a>
  </p>
</div>

You can also show on your repository that your app is made with **nasa_api** by using one of the following badges:

[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg)](https://github.com/myConsciousness/nasa-api)
[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg?style=flat-square)](https://github.com/myConsciousness/nasa-api)
[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg?style=for-the-badge)](https://github.com/myConsciousness/nasa-api)

```
[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg)](https://github.com/myConsciousness/nasa-api)
[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg?style=flat-square)](https://github.com/myConsciousness/nasa-api)
[![Powered by nasa_api](https://img.shields.io/badge/Powered%20by-nasa_api-00acee.svg?style=for-the-badge)](https://github.com/myConsciousness/nasa-api)
```

## 1.8. License 🔑

All resources of **nasa_api** is provided under the `BSD-3` license.

```license
Copyright 2023 Kato Shinya. All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided the conditions.
```

> **Note**</br>
> License notices in the source are strictly validated based on `.github/header-checker-lint.yml`. Please check [header-checker-lint.yml](https://github.com/myConsciousness/nasa-api/tree/main/.github/header-checker-lint.yml) for the permitted standards.

## 1.9. More Information 🧐

**nasa_api** was designed and implemented by **_Kato Shinya ([@myConsciousness](https://github.com/myConsciousness))_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/nasa-api/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/nasa_api/latest/nasa_api/nasa_api-library.html)
- [Release Note](https://github.com/myConsciousness/nasa-api/releases)
- [Bug Report](https://github.com/myConsciousness/nasa-api/issues)
