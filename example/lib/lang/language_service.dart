import 'package:flutter/material.dart';

import 'en_US.dart';
import 'id_ID.dart';

import 'package:translatebebasan/translatebebasan.dart';

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
