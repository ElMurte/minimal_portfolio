import 'package:flutter/material.dart';
import 'package:minimal_portfolio/animated_shapes.dart';
import 'package:minimal_portfolio/expiriences.dart';
import 'package:minimal_portfolio/firstcontent.dart';
import 'package:minimal_portfolio/hovertext.dart';
import 'package:minimal_portfolio/mainproject.dart';
import 'package:minimal_portfolio/projectcard.dart';
import 'package:minimal_portfolio/secondaryprojectcard.dart';
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
  String _selectedSection = 'Intro';
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
                runApp(const MyApp());
              }),
          actions: <Widget>[
            if (MediaQuery.of(context).size.width > 600)
              Row(
                children: <Widget>[
                  _buildLink('Intro', _initial),
                  _buildLink('About', _aboutKey),
                  _buildLink('Experience', _experienceKey),
                  _buildLink('Projects', _projectKey),
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
              stops: const [0.3, 1.0],
              colors: [
                Colors.white70.withOpacity(0.001), Colors.white54
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

                    const Text("Other projects",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          MediaQuery.of(context).size.width > 600
                              ? const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SecondaryProjectCard(),
                                    SecondaryProjectCard(),
                                    SecondaryProjectCard(),
                                  ],
                                )
                              : const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SecondaryProjectCard(),
                                    SecondaryProjectCard(),
                                    SecondaryProjectCard(),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue
                          .withOpacity(0.5), // Customize the background color.
                      padding: const EdgeInsets.all(
                          16.0), // Add padding for content.
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const HoverTextWidget(
                              "Built with Flutter and AI tools using"),
                          const SizedBox(width: 8.0),
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
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    double paddingSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.1 : 20.0;
    double marginSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.12 : 0.0;
    return Container(
      padding: EdgeInsets.only(
          top: paddingSize * 0.5, left: paddingSize, right: paddingSize),
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
                'https://images.pexels.com/photos/4474033/pexels-photo-4474033.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            playStoreUrl:
                'https://upload.wikimedia.org/wikipedia/commons/e/e7/Google_play_store.png?20230511225448',
            bookDescription: 'Coming soon',
            appDescription: '',
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
            description:
                "For the SWE exam, whitin a team of 7 students, we had develop a dashboard and a mobile app to track users of an computer laboratory with GPS, NFC, blockchain. I have mainly worked in the mobile app(using Flutter with setState pattern from the official docs). The goal was to simulate adevelopment cycle,from requirements to the initial deployment (no maintenance phase), while switching the roles during the cycle.",
            repourl: 'https://sweleven.gitlab.io/blockcovid/',
            externalurl:
                'https://blog.imolainformatica.it/2021/08/26/sinergie-azienda-universitablock-covid/',
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
