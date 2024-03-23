import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static void launchURL(String url) async {
    launchUrl(Uri.parse(url));
    // if (!await launchUrl(
    //   Uri.parse(url),
    //   mode: LaunchMode.externalApplication,
    //   webOnlyWindowName: '_blank',
    // )) {
    //   throw Exception('Could not launch $url');
    // }
    // return true;
  }
}
