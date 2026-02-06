import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainProjectWidget extends StatefulWidget {
  final String imageUrl;
  final String playStoreUrl;
  final String bookDescription;
  final String appDescription;

  const MainProjectWidget({
    super.key,
    required this.imageUrl,
    required this.playStoreUrl,
    required this.bookDescription,
    required this.appDescription,
  });

  get _skills => ["Containers","Python", "Airflow","dbt","Supabase"];

  @override
  MainProjectWidgetState createState() => MainProjectWidgetState();
}

class MainProjectWidgetState extends State<MainProjectWidget> {
  bool isHovered = false;
  String cppurl = "";
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          // Open another browser page with the link
          await _launchUrl();
        },
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          shadowColor: isHovered ? Colors.blue : Colors.grey,
          elevation: isHovered ? 10 : 2, // Apply elevation on hover
          
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5 > 400
                      ? MediaQuery.of(context).size.height * 0.5
                      : 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isHovered
                        ? 1
                        : MediaQuery.of(context).size.width > 1100
                            ? 0.4
                            : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: widget.imageUrl.startsWith('assets/')
                          ? Image.asset(
                              widget.imageUrl,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              widget.imageUrl,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Stock Signals",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: isHovered
                        ? Colors.blue
                        : Colors.grey.shade500,
                  ),
                  textAlign: TextAlign.center,
                ),  
                const SizedBox(height: 8),
                Text(
                  widget.appDescription,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 18),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.code),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      " " + widget._skills.join(", "),
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://finance.yahoo.com/');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
