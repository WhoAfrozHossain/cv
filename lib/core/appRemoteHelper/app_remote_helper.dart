import 'app_url.dart';

class AppRemoteHelper {
  AppRemoteHelper._();

  static AppUrls appUrls = new AppUrls();

  static header() {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return requestHeaders;
  }
}
