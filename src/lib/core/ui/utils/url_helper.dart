import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> open(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
