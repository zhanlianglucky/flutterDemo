import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'AppLocalizations.dart';
import 'LanguageConfig.dart';


///语言支持代理
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  @override
  bool isSupported(Locale locale) {
    print("locale.languageCode:"+locale.languageCode);
    return LanguageConfig.supportLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return new SynchronousFuture<AppLocalizations>(new AppLocalizations(locale: locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

  static AppLocalizationsDelegate delegate =  AppLocalizationsDelegate();

}