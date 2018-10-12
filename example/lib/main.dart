import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fluintl/fluintl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();
//    setLocalizedSimpleValues(localizedSimpleValues);//配置简单多语言资源
    setLocalizedValues(localizedValues); //配置多语言资源

//    _locale = new Locale('en', 'US');//指定语言为English
//    _locale = new Locale('zh', 'HK');//指定语言为繁體中文（香港）
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      locale: _locale,
      localizationsDelegates: [
//        GlobalMaterialLocalizations.delegate,//未导入flutter_localizations,暂时屏蔽.
//        GlobalWidgetsLocalizations.delegate,//未导入flutter_localizations,暂时屏蔽.
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //HomePage init.
    CustomLocalizations.init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              CustomLocalizations.of(context).getString(StringIds.titleHome)),
        ),
        body: Center(
          child: new Text(
              CustomLocalizations.instance.getString(StringIds.titleHome)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push<String>(context,
                new CupertinoPageRoute(builder: (ctx) => new SettingPage()));
          },
          child: Icon(Icons.navigate_next),
        ));
  }
}

class SettingPage extends StatefulWidget {
  @override
  State createState() => _SettingPageState();
}

class _SettingPageState extends LBaseState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    CustomLocalizations _customLocal = CustomLocalizations.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(cl.getString(StringIds.titleSetting)),
      ),
      body: new ListView(
        children: <Widget>[
          ListTile(title: Text(CustomLocalizations.of(context).getString(StringIds.titleSetting))),
          ListTile(title: Text(CustomLocalizations.instance.getString(StringIds.titleSetting))),
          ListTile(title: Text(_customLocal.getString(StringIds.titleSetting))),
          ListTile(title: Text(cl.getString(StringIds.titleSetting))),
          ListTile(),
          ListTile(title: Text(cl.getString(StringIds.titleSetting, languageCode: 'en', countryCode: 'US'))),
          ListTile(title: Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'CN'))),
          ListTile(title: Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'HK'))),
          ListTile(title: Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'TW'))),
        ],
      ),
    );
  }
}

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      StringIds.titleHome: 'Home',
      StringIds.titleSetting: 'Setting',
    }
  },
  'zh': {
    'CN': {
      StringIds.titleHome: '主页',
      StringIds.titleSetting: '设置',
    },
    'HK': {
      StringIds.titleHome: '主頁',
      StringIds.titleSetting: '設置',
    },
    'TW': {
      StringIds.titleHome: '主頁',
      StringIds.titleSetting: '設置',
    }
  }
};

class StringIds {
  static String titleHome = 'title_home';
  static String titleSetting = 'title_setting';
}
