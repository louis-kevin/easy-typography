import 'package:flutter/material.dart';
import 'package:easy_typography/easy_typography.dart';

class MyLocale extends TextLocale {
  @override
  String localize(String key) {
    return 'My new text';
  }
}

void main() {
  BaseTextLocale().setLocale(MyLocale());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BodyMediumText(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            DisplayLargeText('My new text'),
            DisplayLargeText.key('my_text_key'),
          ],
        ),
      ),
    );
  }
}
