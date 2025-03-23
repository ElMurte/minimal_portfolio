import 'package:flutter/material.dart';
import 'package:minimal_portfolio/animated_shapes.dart';
import 'package:minimal_portfolio/experiences.dart';
import 'package:minimal_portfolio/firstcontent.dart';
import 'package:minimal_portfolio/hovertext.dart';
import 'package:minimal_portfolio/mainproject.dart';
import 'package:minimal_portfolio/projectcard.dart';
import 'package:minimal_portfolio/secondaryprojectcard.dart';
import 'package:minimal_portfolio/aboutwidget.dart';
import 'package:minimal_portfolio/socialmedialinks.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: unused_import
import 'techanmiation.dart';

//

//1  <title>Elvis Murtezan</title>
//2  <meta name="description" content="Explore the portfolio of Elvis Murtezan build with Flutter, a passionate developer based in the Netherlands. ">//<link rel="icon" type="image/png" href="your-favicon.png" />
/*3 optional
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "Person",
  "name": "Elvis Murtezan",
  "jobTitle": "Developer"
}
</script>
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  final List<Widget> secondaryprojects = [
    const SecondaryProjectCard(
      title: 'MCBurger',
      context_of_project: "OOP exam",
      description:
          "Developed a simple fast food management system, following the MVC design pattern",
      maintechnologies: ["C++", "Qt", "CSS"],
      repourl: "https://github.com/ElMurte/MCBURGER",
    ),
    const SecondaryProjectCard(
      title: 'Netmovies',
      num_of_people: 3,
      context_of_project: "Tech Web exam",
      description:
          "Created a streaming website without using third-party libraries(as accessible as possible).",
      maintechnologies: ["Javascript", "HTML", "CSS", "PHP"],
      repourl: "https://github.com/ElMurte/GFE",
    ),
    const SecondaryProjectCard(
      title: 'NYC Flight Analysis',
      description:
          "built a model at first with a subset of the covariates(7) and second with all the covariates(19)",
      repourl:
          "https://github.com/ElMurte/Data-Mining-Project-analysis-Datasets-using-R",
      maintechnologies: ["R"],
      context_of_project: "Data Mining exam",
    ),
  ];
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
    //final screenwidth = MediaQuery.of(context).size.width;
    //final screenheight = MediaQuery.of(context).size.height;
    //final isWideScreen = MediaQuery.of(context).size.width > 1100;
    //final isTablet = MediaQuery.of(context).size.width > 650 &&
    //MediaQuery.of(context).size.width <= 1100;
    //final isMobile = MediaQuery.of(context).size.width < 650;
    /*double paddingSize = isWideScreen
        ? screenwidth * 0.11
        : isTablet
            ? screenwidth * 0.06
            : screenwidth * 0.03;
    double marginSize = isWideScreen
        ? screenwidth * 0.12
        : isTablet
            ? screenwidth * 0.06
            : screenwidth * 0.03;*/
    const String github = "https://github.com/ElMurte";
    const String linkedin = "https://www.linkedin.com/in/elvismurtezan/";
    return MaterialApp(
        title: 'Elvis Murtezan',
        theme: _buildTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(
                appBar: AppBar(
                  title: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Elvis Murtezan',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        //await Navigator.pushReplacementNamed(context, '/');

                        setState(() {
                          _selectedSection = 'Intro';
                          scrollIntoWidget(_initial);
                        });
                      }),
                  actions: <Widget>[
                    Switch(
                      activeColor: Colors.blue,
                      value: _isDarkMode,
                      onChanged: (value) {
                        _toggleTheme();
                      },
                    ),
                    if (MediaQuery.of(context).size.width > 1100)
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: <Widget>[
                            _buildLink('Intro', _initial),
                            _buildLink('About', _aboutKey),
                            _buildLink('Experience', _experienceKey),
                            _buildLink('Projects', _projectKey),
                          ],
                        ),
                      )
                    else
                      SingleChildScrollView(
                        // controller: _scrollController,
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
                                default:
                                  scrollIntoWidget(_initial);
                              }
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Intro',
                                child: Text(
                                  'Intro',
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'About',
                                child: Text(
                                  'About',
                                ),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Experience',
                                child: Text('Experience'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Projects',
                                child: Text('Projects'),
                              ),
                            ];
                          },
                        ),
                      ),
                  ],
                ),
                body: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [0.75, 1.0],
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
                                child: const StaticBackground()),

                            /*SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Positioned(
                                  right: 50,
                                  top: 50,
                                  child: RotatingClockCircular3DImages()),
                            ),*/
                            Column(
                              children: [
                                RepaintBoundary(
                                    key: _initial,
                                    child: const FirstContent(
                                      thelinks: SocialMediaLinks(
                                        githublink: github,
                                        linkedinlink: linkedin,
                                      ),
                                    )),

                                RepaintBoundary(
                                    key: _aboutKey, child: const AboutWidget()),

                                RepaintBoundary(
                                    key: _experienceKey,
                                    child: const ExperienceWidget()),

                                RepaintBoundary(
                                    key: _projectKey, child: _buildProjects()),
                                // Footer section

                                const Text("Other projects",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    children: [
                                      MediaQuery.of(context).size.width > 1100
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: secondaryprojects,
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: secondaryprojects,
                                            ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  color: Colors.transparent.withOpacity(
                                      0.01), // Customize the background color.
                                  padding: const EdgeInsets.all(
                                      16.0), // Add padding for content.
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /*if (MediaQuery.of(context).size.width <
                                      950)
                                    const Row(
                                      children: [
                                        SocialMediaLinks(
                                          githublink: github,
                                          linkedinlink: linkedin,
                                        ),
                                      ],
                                    ),*/
                                      const Row(children: [
                                        SocialMediaLinks(
                                          githublink: github,
                                          linkedinlink: linkedin,
                                        )
                                      ]),
                                      MediaQuery.of(context).size.width < 600
                                          ? const Expanded(
                                              child: HoverTextWidget(
                                                  "Built with Flutter and AI copilot tools"),
                                            )
                                          : const HoverTextWidget(
                                              "Built with Flutter and AI copilot tools"),
                                      const SizedBox(width: 8.0),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () => {
                                              launchUrl(Uri.parse(
                                                  "https://github.com/features/copilot"))
                                            },
                                            child: Image.network(
                                              'https://github.gallerycdn.vsassets.io/extensions/github/copilotvs/1.110.0.0/1694462364886/Microsoft.VisualStudio.Services.Icons.Default',
                                              height:
                                                  45.0, // Limit the height to 50 pixels.
                                            ),
                                          ),
                                          const SizedBox(
                                              width:
                                                  5.0), // Add spacing between icons.
                                          InkWell(
                                            onTap: () => {
                                              launchUrl(Uri.parse(
                                                  "https://chat.openai.com/"))
                                            },
                                            child: Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/2048px-ChatGPT_logo.svg.png',
                                              height:
                                                  45.0, // Limit the height to 50 pixels.
                                            ),
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
                    /* if (MediaQuery.of(context).size.width > 1100)
                  const Positioned(
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        child: SocialMediaLinks(
                          githublink: github,
                          linkedinlink: linkedin,
                        ),
                      ))
                else
                  const SizedBox(),*/
                  ],
                ),
              )
        });
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
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }

  Widget _buildProjects() {
    //double screenwidth = MediaQuery.of(context).size.width;
    //final isWideScreen = MediaQuery.of(context).size.width > 1100;
    double paddingSize = MediaQuery.of(context).size.width > 1100
        ? MediaQuery.of(context).size.width * 0.1
        : 20.0;
    double marginSize = MediaQuery.of(context).size.width > 1100
        ? MediaQuery.of(context).size.width * 0.06
        : 0.0;
    return Container(
      padding: EdgeInsets.only(
          top: paddingSize * 0.5, left: paddingSize, right: paddingSize),
      margin: EdgeInsets.only(
          top: marginSize * 0.05, left: marginSize, right: marginSize),
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
                'https://images.pexels.com/photos/3843282/pexels-photo-3843282.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            playStoreUrl:
                'https://upload.wikimedia.org/wikipedia/commons/e/e7/Google_play_store.png?20230511225448',
            bookDescription: 'Coming soon',
            appDescription: '',
          ),
          SizedBox(height: 16),
          SizedBox(
            child: ProjectCard(
              title: 'BlockCOVID',
              numberOfPersons: '7',
              context: 'SWE Exam',
              timeframe: '10/2020 - 6/2021',
              technologies: [
                'Flutter',
                'NFC/GPS',
                'Angular',
                'NodeJS',
                'MongoDB'
              ],
              mainUrlImage:
                  'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  "We had developed a dashboard and a mobile app to track users of a computer laboratory with GPS, NFC, and blockchain. I have mainly worked in the mobile app(using Flutter with a setState pattern from the official docs). The goal was to simulate a development cycle, from requirements to the initial deployment (no maintenance phase), while switching the roles during the cycle.",
              repourl: 'https://sweleven.gitlab.io/blockcovid/',
              externalurl:
                  'https://blog.imolainformatica.it/2021/08/26/sinergie-azienda-universitablock-covid/',
            ),
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
              backgroundColor: Color.fromARGB(255, 0, 14, 37),
              foregroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color.fromARGB(255, 0, 10, 26),
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
