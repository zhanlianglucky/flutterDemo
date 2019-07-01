import 'dart:ui';

import 'package:flutter/material.dart';

import 'LanguageConfig.dart';

///字符串放置位置
class AppLocalizations {
  Locale locale;

  AppLocalizations({this.locale});

  //定义字符参数
  static Map<String, Map<String, String>> _localizationValues = {
    LanguageConfig.EN: {
      'appTitle': 'App title',
      'appContent':'Hello,world!',
    },
    LanguageConfig.ZH: {
      'appTitle': 'APP 标题',
      'appContent':'你好，世界！',
    },
  };

  String _getText(String key) {
    return _localizationValues[locale.languageCode][key];
  }

  //对外提供的访问方法
  static String getLocalizationText(BuildContext context,String key) {
    return of(context)._getText(key);
  }

  static AppLocalizations _appLocalizations;
  static AppLocalizations of(BuildContext context) {
    if (_appLocalizations == null) {
      _appLocalizations = Localizations.of(context, AppLocalizations);
    }
    return _appLocalizations;
  }
}
