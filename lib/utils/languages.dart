import 'package:get/get.dart';
import 'package:bKash_flutter/languages/en_US.dart';

class Languages extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        // Define more languages for example "bn_BD" and import the translation file
        // Translation file located in lib/languages/
      };

  static final Map<String, String> languageNames = {
    // Define the language and country code with actual name of the language
    'en_US': 'English',
  };
}
