//import 'dart:io';
//import 'dart:js';

import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop_window/desktop_window.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///////////////////////////////////////////////////
// app modules
import 'language.dart';

var appText = AppText();

var appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(0xDD, 0, 0, 0xFF),
  ),
  backgroundColor: Colors.white,
);

///////////////////////////////////////////////////
// assets

const aiLogoFile = AssetImage('lib/assets/ailogo.png');
const goldLogoFile = AssetImage('lib/assets/gold.png');
const flagUnitedStates = AssetImage('lib/assets/united-states.png');
const flagFrance = AssetImage('lib/assets/france.png');
const flagMexico = AssetImage('lib/assets/mexico.png');
const flagPhillipines = AssetImage('lib/assets/philippines.png');

///////////////////////////////////////////////////
// MAIN

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // future feature
  // DesktopWindow.setMaxWindowSize(Size (200, 700));
  // DesktopWindow.resetMaxWindowSize();

  /*
  if (DesktopWindow.Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');

    setWindowMaxSize(const Size(max_width, max_height));
    setWindowMinSize(const Size(min_width, min_height));
  }
*/


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appText.title,
      home: MyHomePage(title: appText.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Home 2',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) appText.language = Language.English;
      if (index == 1) appText.language = Language.French;
      if (index == 2) appText.language = Language.Spanish;
      if (index == 3) appText.language = Language.Tagalog;
    });
  }

  void _onClick(String Pressed) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      if (Pressed == 'English') appText.language = Language.English;
      if (Pressed == 'French') appText.language = Language.French;
      if (Pressed == 'Spanish') appText.language = Language.Spanish;
      if (Pressed == 'Tagalog') appText.language = Language.Tagalog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: appTheme,
      theme: appTheme,
      home: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              appText.title,
              style: GoogleFonts.handlee(fontSize: 42.0,),
            )),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Image(
                  image: goldLogoFile,
                  width: 250,
                ),
//                Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ),
            Padding(
              // Even Padding On All Sides
              // padding: EdgeInsets.all(10.0),
              // Symetric Padding
              // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              // Different Padding For All Sides
              padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 4.0),

              child: Text(
                appText.body,
                softWrap: true,
                style: GoogleFonts.handlee(fontSize: 25.0,),
              ),
            )
          ],
        ),
/*
        persistentFooterButtons:
        <Widget>[
          new IconButton(
              icon: new Icon(Icons.flag),
              onPressed: () => _onClick('English')),
          new IconButton(
              icon: new Icon(Icons.language),
              onPressed: () => _onClick('Spanish')),
          new IconButton(
              icon: new Icon(Icons.currency_franc), onPressed: () => _onClick('French')),
          new IconButton(
              icon: new Icon(Icons.language), onPressed: () => _onClick('Tagalog')),
        ],
*/
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'English',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'French',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'Spanish',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'Tagalog',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
