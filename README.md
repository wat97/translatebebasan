# translatebebasan
[![License: MIT](https://img.shields.io/badge/License-MIT-ff69b4.svg)](https://github.com/wat97/translatebebasan/blob/main/LICENSE)

translatebebasan is Use for make your application multi-language with easily implementation

## Example
<img src="https://raw.githubusercontent.com/wat97/translatebebasan/main/resources/gifs/example.gif" width="300"/>

And open this to see example [here](https://github.com/wat97/translatebebasan/tree/main/example)

## Using

### Multiple Language in application

Create a Map for each language that will be declared like this
```dart
Map<String, String> en_US = {
  'hallo_world': 'Hallo World',
  'text_home': 'You have pushed the button this many times:',
  'title': 'Flutter Demo',
};

Map<String, String> id_ID = {
  'hallo_world': 'Halo Dunia',
  'text_home': 'Anda telah menekan tombol ini sebanyak: ',
  'title': 'Flutter pratinjau',
};
```

And mapping map to class abstrac in glosarium and add supported language. In list supportedlocales first element is use as default locales
```dart
class LanguageService extends Glosarium {
  @override
  Map<String, Map<String, String>> get keys => {
        'id_ID': id_ID,
        'en_US': en_US,
      };

  @override
  List<Locale> get supportedLocales => const [
        Locale('id', 'ID'),
        Locale('en', 'US'),
      ];
}
```
In main added binding ```LocalesBasan().addGlosarium(LanguageService());```
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalesBasan().addGlosarium(LanguageService());
  runApp(MyApp());
}
```
And trala you just add in String .gr

```dart
Text(
    'text_home'.gr,
),
```

## Issues
Please file any issues, bugs or feature request [here](https://github.com/wat97/translatebebasan/issues).

## License

This project is licensed under the [MIT License](https://github.com/wat97/translatebebasan/blob/main/LICENSE)