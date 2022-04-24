import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppText {
  var title = "I am Rich";
  var copyright = "Copyright Jerry Hobby 2022";
  var body =
      "A text field lets the user enter text, either with hardware keyboard or with an onscreen keyboard. The text field calls the onChanged callback whenever the user changes the text in the field. If the user indicates that they are done typing in the field (e.g., by pressing a button on the soft keyboard), the text field calls the onSubmitted callback.";
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

///////////////////////////////////////////////////
// MyApp -- entry point

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final aiLogoFile = File("lib/ailogo.png");
//    ![](../android/app/src/main/res/drawable/ailogo.png)
 //   ![](../android/app/src/main/res/drawable/cats.jpg)

    return MaterialApp(
      darkTheme: appTheme,
      theme: appTheme,
      home: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(appText.title,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Lucida Console',
                //fontStyle: FontStyle.italic,
                //decoration: TextDecoration.underline,
              ),
            )








        ),
        body: Column(
          children: [
            Text(appText.body,
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
                child:
                  Image.file(aiLogoFile,width: 200,),
//                Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
