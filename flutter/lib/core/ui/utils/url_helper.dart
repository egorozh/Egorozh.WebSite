import 'dart:js' as js;

class UrlHelper {
  static void open(String url) {
    js.context.callMethod('open', [url]);
  }
}
