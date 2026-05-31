import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  final String githublink;
  final String linkedinlink;
  const SocialMediaLinks(
      {super.key, required this.githublink, this.linkedinlink = ""});
  @override
  Widget build(BuildContext context) {
    const String linkedinpng =
        "https://images.rawpixel.com/image_png_social_square/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk4Mi1kMS0xMC5wbmc.png";
    const String githubpng =
        "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png";
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(githublink));
          },
          child: Image.network(
            githubpng,
            width: 45,
            height: 45.0, // Limit the height to 50 pixels.
          ),
        ),
      ),
      const SizedBox(width: 5.0), // Add spacing between icons.
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(linkedinlink));
          },
          child: Image.network(
            linkedinpng,
            width: 45,
            height: 45.0, // Limit the height to 50 pixels.
          ),
        ),
      ),
    ]);
  }
}
