import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ImageWithMisalignedSquareEffect extends StatefulWidget {
  @override
  _ImageWithMisalignedSquareEffectState createState() =>
      _ImageWithMisalignedSquareEffectState();
}

class _ImageWithMisalignedSquareEffectState
    extends State<ImageWithMisalignedSquareEffect> {
  bool isHovered = false;

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
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Wrapper for Image and Square
          Container(
            width: 220.0, // 10% larger than the image
            height: 220.0, // 10% larger than the image
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Misaligned Square with Transition
                Positioned(
                  right: 20.0, // 10% from the right of the wrapper
                  top: 20.0, // 10% from the top of the wrapper
                  child: AnimatedContainer(
                    duration:
                        Duration(milliseconds: 300), // Adjust the duration
                    transform: isHovered
                        ? Matrix4.translationValues(10.0, 0.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: 200.0, // Same size as the wrapper
                    height: 200.0, // Same size as the wrapper
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0, // Adjust the border width
                      ),
                    ),
                  ),
                ),
                // Image with Hover Effect and Positioning
                Container(
                  color: (!isHovered) ? Colors.blue : Colors.transparent,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    transform: isHovered
                        ? Matrix4.translationValues(-10.0, -10.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: 200.0,
                    height: 200.0,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: isHovered ? 1 : 0.5, // Adjust the opacity
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/32709092',
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  String _selectedSection = 'About';
  final ScrollController _scrollController = ScrollController();
  double _aboutOffset = 1.0;
  double _projectsOffset = 100.0;
  double _experienceOffset = 400.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _aboutOffset = 0.0;
      _projectsOffset = _aboutOffset + _buildAboutHeight();
      _experienceOffset = _projectsOffset + _buildProjectsHeight();
    });
  }

  double _buildAboutHeight() {
    // Calculate the height of the About section
    // You can add your own logic here
    return 200.0; // Change this to the actual height
  }

  double _buildProjectsHeight() {
    // Calculate the height of the Projects section
    // You can add your own logic here
    return 400.0; // Change this to the actual height
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _selectedLinkColor = _isDarkMode ? Colors.white : Colors.blue;

    return MaterialApp(
      title: 'Elvis Murtezan',
      theme: _buildTheme(),
      home: Container(
        child: Scaffold(
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
                  _selectedSection = 'About';
                  _scrollToSection(_aboutOffset);
                });
              },
            ),
            actions: <Widget>[
              if (MediaQuery.of(context).size.width > 600)
                Row(
                  children: <Widget>[
                    _buildLink('About', _aboutOffset),
                    _buildLink('Projects', _projectsOffset),
                    _buildLink('Experience', _experienceOffset),
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
                      });
                      _scrollToSection(
                        value == 'About'
                            ? _aboutOffset
                            : value == 'Projects'
                                ? _projectsOffset
                                : _experienceOffset,
                      );
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
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hello people, I am',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '                   Elvis Murtezan.',
                        style: TextStyle(fontSize: 46),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'I build software with different technologies.',
                        style: TextStyle(fontSize: 43),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'I’m a confident software engineer, I consider myself a full stack developer \nand enjoy it a lot, currently working in the air transport industry.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                _buildAbout(),
                _buildProjects(),
                _buildExperience(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperience() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Experience',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        // Add your experience content here
      ],
    );
  }

  Widget _buildLink(String section, double offset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSection = section;
            _scrollToSection(offset);
          });
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

  Widget _buildAbout() {
    Key _projectsKey = GlobalKey();
    // Add this line
    double padding_size = MediaQuery.of(context).size.width > 600 ? 80.0 : 16.0;
    double margin_size = MediaQuery.of(context).size.width > 600 ? 220.0 : 0.0;
    return Container(
      padding: EdgeInsets.all(padding_size),
      margin: EdgeInsets.only(left: margin_size, right: margin_size),
      child: Column(
        key: _projectsKey, // Add this line
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              'About',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(width: 16),
          ]),
          Row(
            children: <Widget>[
              // Left side: Description
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  child: Text(
                    'Your Description Here',
                    style: TextStyle(
                      fontSize: 16.0, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
              // Right side: Image
              Container(
                child: ImageWithMisalignedSquareEffect(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProjects() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Projects',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        _buildProjectCard(
          'BlockCOVID',
          '7',
          'SWE Exam',
          '10/2020 - 6/2021',
          'flutter',
          'https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/flutter-logomark-320px.png',
        ),
        _buildProjectCard(
          'BlockCOVID',
          '7',
          'SWE Exam',
          '10/2020 - 6/2021',
          'flutter',
          'https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/flutter-logomark-320px.png',
        )
      ],
    );
  }

  Widget _buildProjectCard(
    String title,
    String numberOfPersons,
    String context,
    String timeframe,
    String technology,
    String mainUrlImage,
  ) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(mainUrlImage),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Number of persons: $numberOfPersons',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Context: $context',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Timeframe: $timeframe',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                technology,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  ThemeData _buildTheme() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF011638),
              foregroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF011638),
            textTheme: const TextTheme(),
          )
        : ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            primaryColorDark: Color(0xFF011638),
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(),
          );
  }
}
