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
