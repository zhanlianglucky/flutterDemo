import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppLocalizations.dart';
import 'AppLocalizationsDelegate.dart';
import 'LanguageConfig.dart';

///语言管理
void main() => runApp(new AppWidget());

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AppState();
}

GlobalKey<DynamicLocalizationState> freeLocalizationStateKey =
    new GlobalKey<DynamicLocalizationState>();

class AppState extends State {
  Locale _locale = LanguageConfig.supportLocaleList[0];
  bool _isChangeLanguage = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      title: AppLocalizations.of(context).getLocalizationText("appTitle"),//注意这个错误是由于context还未创建
      onGenerateTitle: (context) {
        return AppLocalizations.getLocalizationText(context, "appTitle");
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("language"),
          backgroundColor: Colors.blue,
        ),
        body: new DynamicLocalizationWidget(
          key: freeLocalizationStateKey,
          child: new Column(
            children: <Widget>[
              new Text(
                  AppLocalizations.getLocalizationText(context, "appContent")),
            ],
          ),
        ),
      ),
      //加载代理
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate.delegate,
      ],
      supportedLocales: LanguageConfig.supportLocaleList,

      //系统切换语言时回调
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        print("localeResolutionCallback: " + locale.languageCode);
        return locale;
      },
      locale: _locale,
    );
  }
}

class DynamicLocalizationWidget extends StatefulWidget {
  final Widget child;

  DynamicLocalizationWidget({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new DynamicLocalizationState();
}


///语言切换暂时没用上
class DynamicLocalizationState extends State<DynamicLocalizationWidget> {
  Locale _locale = LanguageConfig.supportLocaleList[0];
  bool flag = false;
  _changeLocale() {
    setState(() {
      if (flag) {
        _locale = LanguageConfig.supportLocaleList[1];
      } else {
        _locale = LanguageConfig.supportLocaleList[0];
      }
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}
