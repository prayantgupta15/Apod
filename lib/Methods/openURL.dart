import 'package:apod/Utils/Strings.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenURL{
  String _url="";
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

   void call()
  {
    _url="tel:${StringUtils.PHONENO}";
    _launchURL();
  }

  void mail()
  {
    _url="mailto:${StringUtils.EMAIL}";
    _launchURL();
  }
  void linkedin()
  {
    _url = StringUtils.LINKEDIN;
    _launchURL();
  }
  void github()
  {
    _url = StringUtils.GITHUB;
    _launchURL();
  }void zealth()
  {
    _url = StringUtils.ZEALTH;
    _launchURL();
  }
}