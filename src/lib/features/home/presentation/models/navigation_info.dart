sealed class NavigationInfo {}

final class PageInfo extends NavigationInfo {
  PageInfo({required this.text, required this.route});

  final String text;
  final String route;
}

final class ExternalUrlInfo extends NavigationInfo {
  ExternalUrlInfo({required this.text, required this.assetName, required this.url});

  final String text;
  final String assetName;
  final String url;
}
