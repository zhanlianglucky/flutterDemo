
import 'package:flutter/material.dart';

///语言配置
class LanguageConfig {

  static const String ZH = 'zh';//中文
  static const String EN = 'en';//英文

  //支持的语言列表
  static const List<String> supportLanguages = [
    ZH,EN,
  ];

  //支持的类型列表
  static const List<Locale> supportLocaleList = [
    const Locale(EN, 'US'),
    const Locale(ZH, 'CH'),
  ];

}