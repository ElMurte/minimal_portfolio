import 'package:flutter/material.dart';
import 'package:minimal_portfolio/animated_shapes.dart';
import 'package:minimal_portfolio/expiriences.dart';
import 'package:minimal_portfolio/firstcontent.dart';
import 'package:minimal_portfolio/mainproject.dart';
import 'package:minimal_portfolio/projectcard.dart';
import 'aboutwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  String _selectedSection = 'About';
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _initial = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elvis Murtezan',
      theme: _buildTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                'Elvis Murtezan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                setState(() {
                  scrollIntoWidget(_initial);
                });
              }),
          actions: <Widget>[
            if (MediaQuery.of(context).size.width > 600)
              Row(
                children: <Widget>[
                  _buildLink('About', _aboutKey),
                  _buildLink('Projects', _projectKey),
                  _buildLink('Experience', _experienceKey),
                ],
              )
            else
              SingleChildScrollView(
                controller: _scrollController,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
                  onSelected: (value) {
                    setState(() {
                      _selectedSection = value;
                      switch (value) {
                        case "About":
                          scrollIntoWidget(_aboutKey);
                        case "Projects":
                          scrollIntoWidget(_projectKey);
                        case "Experience":
                          scrollIntoWidget(_experienceKey);
                          break;
                        default:
                          scrollIntoWidget(_initial);
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'About',
                        child: Text(
                          'About',
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Projects',
                        child: Text('Projects'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Experience',
                        child: Text('Experience'),
                      ),
                    ];
                  },
                ),
              ),
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                _toggleTheme();
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.25, 1.0],
              colors: [
                Colors.white70.withOpacity(0.001), Colors.white,
                //Theme.of(context).primaryColor,
                //Theme.of(context).scaffoldBackgroundColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const AnimatedBackground()),
                Column(
                  children: [
                    RepaintBoundary(key: _initial, child: const FirstContent()),

                    RepaintBoundary(key: _aboutKey, child: const AboutWidget()),

                    RepaintBoundary(
                        key: _experienceKey, child: const ExperienceWidget()),

                    RepaintBoundary(key: _projectKey, child: _buildProjects()),
                    // Footer section
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue, // Customize the background color.
                      padding: const EdgeInsets.all(
                          16.0), // Add padding for content.
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Built with Flutter and AI tools using',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          Row(
                            children: [
                              Image.network(
                                'https://github.gallerycdn.vsassets.io/extensions/github/copilotvs/1.110.0.0/1694462364886/Microsoft.VisualStudio.Services.Icons.Default',
                                height: 50.0, // Limit the height to 50 pixels.
                              ),
                              const SizedBox(
                                  width: 8.0), // Add spacing between icons.
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/2048px-ChatGPT_logo.svg.png',
                                height: 50.0, // Limit the height to 50 pixels.
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Widget _buildLink(String section, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSection = section;

            scrollIntoWidget(key);
          });
          //_scrollToSection(offset);
        },
        child: Text(
          section,
          style: TextStyle(
            color: _selectedSection == section ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProjects() {
    double paddingSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.1
        : 40.0;
    double marginSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 0.0;
    return Container(
      padding: EdgeInsets.all(paddingSize),
      margin: EdgeInsets.only(left: marginSize, right: marginSize),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Projects',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          MainProjectWidget(
            imageUrl:
                'https://images.pexels.com/photos/1047524/pexels-photo-1047524.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            playStoreUrl:
                'https://play.google.com/store/apps/details?id=com.example.app',
            bookDescription:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            appDescription:
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.',
          ),
          SizedBox(height: 16),
          ProjectCard(
            title: 'BlockCOVID',
            numberOfPersons: '7',
            context: 'SWE Exam',
            timeframe: '10/2020 - 6/2021',
            technology: 'flutter',
            mainUrlImage:
                'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            description: "This is a sample for a description",
          ),
        ],
      ),
    );
  }

  void scrollIntoWidget(key) {
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject != null) {
      final scrollableState = Scrollable.of(key.currentContext!);
      final position = scrollableState.position;
      position.ensureVisible(
        renderObject,
        alignment: 0.0,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  ThemeData _buildTheme() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF011638),
              foregroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF011638),
            textTheme: const TextTheme(
                headlineLarge: TextStyle(
                  color: Colors.white70,
                ),
                headlineMedium: TextStyle(
                  color: Colors.white70,
                ),
                headlineSmall: TextStyle(
                  color: Colors.white,
                ),
                bodyLarge: TextStyle(
                  color: Colors.white70,
                ),
                bodyMedium: TextStyle(
                  color: Colors.white70,
                ),
                bodySmall: TextStyle(
                  color: Colors.white70,
                ),
                displayLarge: TextStyle(
                  color: Colors.white,
                ),
                displayMedium: TextStyle(
                  color: Colors.white,
                ),
                displaySmall: TextStyle(
                  color: Colors.white,
                ),
                titleLarge: TextStyle(
                  color: Colors.white,
                ),
                titleMedium: TextStyle(
                  color: Colors.white,
                ),
                titleSmall: TextStyle(
                  color: Colors.white,
                )),
          )
        : ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            primaryColorDark: const Color(0xFF011638),
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(),
          );
  }
}
