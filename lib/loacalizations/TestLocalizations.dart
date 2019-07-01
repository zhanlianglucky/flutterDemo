import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppLocalizations.dart';
import 'AppLocalizationsDelegate.dart';
import 'LanguageConfig.dart';


///语言管理
void main() => runApp(new AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      title: AppLocalizations.of(context).getLocalizationText("appTitle"),//注意这个错误是由于context还未创建
      onGenerateTitle: (context){
        return AppLocalizations.getLocalizationText(context,"appTitle");
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("language"),
          backgroundColor: Colors.blue,
        ),
        body: new ContentWidget(),
      ),
      //加载代理
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate.delegate,
      ],
      supportedLocales: LanguageConfig.supportLocaleList,
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales){//动态切换语言回调
        print("localeResolutionCallback: "+locale.languageCode);
        return locale;
      },
    );
  }
}


class ContentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ContentState();
}

class ContentState extends State<ContentWidget>{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(AppLocalizations.getLocalizationText(context, "appContent")),
    );
  }
}