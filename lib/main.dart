//import 'dart:io';
//import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum Language { English, Spanish, Tagalog, French, SIZE }

class AppText {
  // set this once and the getter handles it from there.
  var _language = Language.English;

  List<String> _hello =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _title =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _copyright =
      List.filled(Language.SIZE.index, "unset", growable: false);
  List<String> _body =
      List.filled(Language.SIZE.index, "unset", growable: false);

  AppText() {
    _hello[Language.English.index] = "Hello";
    _hello[Language.Spanish.index] = "Hola";
    _hello[Language.French.index] = "Bonjour";
    _hello[Language.Tagalog.index] = "Hello";

    _title[Language.English.index] = "I am Rich";
    _title[Language.Spanish.index] = "Soy Rico";
    _title[Language.French.index] = "Je Suis Riche";
    _title[Language.Tagalog.index] = "Ako ay Mayaman";

    _copyright[Language.English.index] = "Copyright Jerry Hobby";
    _copyright[Language.Spanish.index] = "Derechos de autor Jerry Hobby";
    _copyright[Language.French.index] = "Droit d'auteur Jerry Hobby";
    _copyright[Language.Tagalog.index] = "Copyright Jerry Hobby";

    _body[Language.English.index] = "ENGLISH TEST --- ";
    _body[Language.Spanish.index] = "Esta aplicación no hace nada en absoluto.";
    _body[Language.French.index] = "Cette application ne fait rien du tout.";
    _body[Language.Tagalog.index] = "Walang ginagawa ang app na ito.";
  }

  String get hello {
    return (_hello[_language.index]);
  }

  String get title {
    return (_title[_language.index]);
  }

  String get copyright {
    return (_copyright[_language.index]);
  }

  String get body {
    return (_body[_language.index]);
  }

  Language get language {
    return (_language);
  }

  set language(Language newLanguage) {
    this._language = newLanguage;
  }
}

///////////////////////////////////////////////////
// MAIN

var appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(0xDD, 0, 0, 0xFF),
  ),
  backgroundColor: Colors.white,
);

var appText = AppText();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appText.title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
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
    final aiLogoFile = AssetImage('lib/assets/ailogo.png');

    return MaterialApp(
      darkTheme: appTheme,
      theme: appTheme,
      home: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              appText.title,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Lucida Console',
                //fontStyle: FontStyle.italic,
                //decoration: TextDecoration.underline,
              ),
            )),
        body: Column(
          children: [
            Text(
              appText.body,
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Lucida Console',
                //fontStyle: FontStyle.italic,
                //decoration: TextDecoration.underline,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: aiLogoFile,
                  width: 100,
                ),
//                Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ),
          ],
        ),
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
      ),
    );
  }
}
