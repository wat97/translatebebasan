import 'dart:ui';

import 'package:flutter/material.dart';

class _BasaHost {
  Locale? locale;

  List<Locale> supportedLocales = [];

  Map<String, Map<String, String>> translation = {};
}

abstract class Glosarium {
  Map<String, Map<String, String>> get keys;

  /// The first supported set as default locale
  List<Locale> get supportedLocales;
}

class LocalesBasan {
  static final _basaHost = _BasaHost();

  Locale? get locale => _basaHost.locale ?? _basaHost.supportedLocales[0];

  set locale(Locale? newLocale) => _basaHost.locale = newLocale;

  List<Locale> get supportedLocale => _basaHost.supportedLocales;

  Map<String, Map<String, String>> get translations => _basaHost.translation;

  ///The current [WidgetsBinding]
  WidgetsBinding? get engine {
    if (WidgetsBinding.instance == null) {
      WidgetsFlutterBinding();
    }
    return WidgetsBinding.instance;
  }

  /// Add Multi Language Map.
  ///
  /// At least have one Language have declare
  ///
  void addBasan(Map<String, Map<String, String>> arti) {
    translations.addAll(arti);
  }

  /// Add Supported Language .
  ///
  /// You must declare support language, if locale not in supported language get element at first
  ///
  void addSupportedLocale(List<Locale> supported) {
    supportedLocale.addAll(supported);
  }

  /// Add abstract class in glosarium
  ///
  /// In glosarium have 2 variabel is Map Language and supported language
  ///
  Future<void> addGlosarium(Glosarium glosarium) async {
    addBasan(glosarium.keys);
    addSupportedLocale(glosarium.supportedLocales);
    await engine!.performReassemble();
  }
}

extension Translate on String {
  // Checks whether the language code and country code are present, and
  // whether the key is also present.
  bool get _fullLocaleAndKey {
    return LocalesBasan().translations.containsKey(
            "${LocalesBasan().locale!.languageCode}_${LocalesBasan().locale!.countryCode}") &&
        LocalesBasan()
            .translations[
                "${LocalesBasan().locale!.languageCode}_${LocalesBasan().locale!.countryCode}"]!
            .containsKey(this);
  }

  String get gr {
    /// The window to which this binding is bound.
    ///
    ///
    if (LocalesBasan().locale?.languageCode == null) return this;
    if (_fullLocaleAndKey) {
      return LocalesBasan().translations[
              "${LocalesBasan().locale!.languageCode}_${LocalesBasan().locale!.countryCode}"]![
          this]!;
    }
    return this;
  }
}
