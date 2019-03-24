import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
/// 多语言资源id管理类.
class Ids {
  static String titleHome = 'title_home';
  static String titleSetting = 'title_setting';
  static String click_times = 'click_times';
}
/// 简单多语言资源.
Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    Ids.titleHome: 'Home',
    Ids.titleSetting: 'Setting',
    Ids.click_times: '%\$0\$s click on %\$1\$s times',
  },
  'zh': {
    Ids.titleHome: '主页',
    Ids.titleSetting: '设置',
    Ids.click_times: '%\$0\$s点击了%\$1\$s次',
  },
};
/// 多语言资源.
Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      Ids.titleHome: 'Home',
      Ids.titleSetting: 'Setting',
      Ids.click_times: '%\$0\$s click on %\$1\$s times',
    }
  },
  'zh': {
    'CN': {
      Ids.titleHome: '主页',
      Ids.titleSetting: '设置',
      Ids.click_times: '%\$0\$s点击了%\$1\$s次',
    },
    'HK': {
      Ids.titleHome: '主頁',
      Ids.titleSetting: '設置',
      Ids.click_times: '%\$0\$s点击了%\$1\$s次',
    },
    'TW': {
      Ids.titleHome: '主頁',
      Ids.titleSetting: '設置',
      Ids.click_times: '%\$0\$s点击了%\$1\$s次',
    }
  }
};

void main() => runApp(MyApp());

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(titleId: Ids.titleHome),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.titleId}) : super(key: key);

  final String titleId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //HomePage init.
    CustomLocalizations.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, widget.titleId)),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () {
                Navigator.push<String>(
                    context,
                    new CupertinoPageRoute(
                        builder: (ctx) => new SettingPage()));
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              IntlUtil.getString(context, Ids.click_times,
                  params: ['Tom', '$_counter']),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
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
        title: Text(IntlUtil.getString(context, Ids.titleSetting)),
      ),
      body: new ListView(
        children: <Widget>[
          ListTile(title: Text(CustomLocalizations.of(context).getString(Ids.titleSetting))),
          ListTile(title: Text(IntlUtil.getString(context, Ids.titleSetting))),
          ListTile(title: Text(CustomLocalizations.instance.getString(Ids.titleSetting))),
          ListTile(title: Text(_customLocal.getString(Ids.titleSetting))),
          ListTile(title: Text(cl.getString(Ids.titleSetting))),
          ListTile(title: Text(IntlUtil.getString(context, Ids.titleSetting, languageCode: 'en', countryCode: 'US'))),
          ListTile(title: Text(IntlUtil.getString(context, Ids.titleSetting, languageCode: 'zh', countryCode: 'CN'))),
          ListTile(title: Text(IntlUtil.getString(context, Ids.titleSetting, languageCode: 'zh', countryCode: 'HK'))),
        ],
      ),
    );
  }
}
