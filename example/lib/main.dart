import 'package:bebasan_example/lang/lang.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:translatebebasan/translatebebasan.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalesBasan().addGlosarium(LanguageService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title'.gr,
      locale: LocalesBasan().locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'title'.gr,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeLanguage({
    required String languageCode,
    required String countryCode,
  }) async {
    setState(() {
      Locale localeData = Locale(
        languageCode,
        countryCode,
      );
      LocalesBasan().locale;
      LocalesBasan().locale = localeData;
    });
    await LocalesBasan().engine!.performReassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'text_home'.gr,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              _changeLanguage(
                languageCode: "id",
                countryCode: "ID",
              );
            },
            tooltip: 'Indonesia',
            child: const Text("ID"),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () async {
              _changeLanguage(
                languageCode: "en",
                countryCode: "US",
              );
            },
            tooltip: 'English',
            child: const Text("EN"),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
