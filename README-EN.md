## [README of Chinese][readme]

# fluintl (Flutter Internationalization Package)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl It is an international library for applications that can be quickly integrated to implement multi-language applications. 
The library encapsulates an internationalization support class that obtains a string by providing a uniform method getString(id). 
CustomLocalizations multi-language support class. LBaseState can get strings neatly.  
Steps for usage:  
1.Establish multi-language resource string id management class StringIds and multi-language resource map  
``` dart
///Multi-language resource id management class. 
class StringIds {  
  static String titleHome = 'title_home';  
}  
///localized simple values.  
Map<String, Map<String, String>> localizedSimpleValues = {  
  'en': {    
    StringIds.titleHome: 'Home',  
  },  
  'zh': {    
    StringIds.titleHome: '主页',  
  },  
};  
///localized values.  
Map<String, Map<String, Map<String, String>>> localizedValues = {  
  'en': {  
    'US': {  
      StringIds.titleHome: 'Home',  
    }  
  },  
  'zh': {  
    'CN': {  
      StringIds.titleHome: '主页',  
    },  
    'HK': {  
      StringIds.titleHome: '主頁',  
    },  
  }  
};  
``` 
2.Configure multi-language resources in MyApp initState (configurable universal or simple multi-language resources, choose one)  
``` dart
  void initState() {    
    super.initState();      
//    setLocalizedSimpleValues(localizedSimpleValues);//set localized simple values.  
    setLocalizedValues(localizedValues); //set localized values.      
  }    
```
3.Specify localizationsDelegates and supportedLocales in the MaterialApp:  
``` dart
MaterialApp(  
   home: MyHomePage(),  
   localizationsDelegates: [  
   GlobalMaterialLocalizations.delegate,  
   GlobalWidgetsLocalizations.delegate,  
   CustomLocalizations.delegate //set Localizations delegate.  
   ],  
   supportedLocales: CustomLocalizations.supportedLocales,//Set support for localized language collections     
);  
```
4.at MyHomePage init CustomLocalizations:  
``` dart
class _MyHomePageState extends State<MyHomePage> {  
  Widget build(BuildContext context) {    
    CustomLocalizations.init(context); //MyHomePageState init.      
    ...      
  }    
}  
```
5.get String  
``` dart
CustomLocalizations.of(context).getString(id)  
CustomLocalizations.instance.getString(id)  
extends or with LBaseState()  (MyHomePageState can not use)  
cl.getString(id)  
```
6.For detailed application of international application, please refer to [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)App。 

### Add dependency
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter  
    
  fluintl: x.x.x  #latest version
```

### APIs
```
setLocalizedSimpleValues(values)            : set localized simple values.
setLocalizedValues(values)                  : set localized values.
CustomLocalizations.delegate                : CustomLocalizations.
CustomLocalizations.supportedLocales        : supported locales.
CustomLocalizations.init(context)           : CustomLocalizations init.(MyHomePage init)
CustomLocalizations.of(context)             : get CustomLocalizations.
getString(id, {languageCode, countryCode})  : get string by id,Can be specified languageCode,countryCode.
LBaseState (extends or with LBaseState)     : It is convenient and concise to get the string cl.getString(id). (MyHomePage cannot be used)
```

### Example
``` dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluintl/fluintl.dart';

///localized values ids class.
class StringIds {
  static String titleHome = 'title_home';
}
///localized simple values.
Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    StringIds.titleHome: 'Home',
  },
  'zh': {
    StringIds.titleHome: '主页',
  },
};
///localized values.
Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      StringIds.titleHome: 'Home',
    }
  },
  'zh': {
    'CN': {
      StringIds.titleHome: '主页',
    },
    'HK': {
      StringIds.titleHome: '主頁',
    },
    'TW': {
      StringIds.titleHome: '主頁',
    }
  }
};

class _MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();
//    setLocalizedSimpleValues(localizedSimpleValues);//set localized simple values.
    setLocalizedValues(localizedValues);//set localized values.
//    _locale = new Locale('en', 'US');//English
//    _locale = new Locale('zh', 'HK');//繁體中文（香港）
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate //set CustomLocalizations delegate.
      ],
      supportedLocales: CustomLocalizations.supportedLocales,//set supportedLocales.
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //HomePageState init.
    CustomLocalizations.init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              CustomLocalizations.of(context).getString(StringIds.titleHome)),
        ),
        body: Center(
          child: new Text(
              CustomLocalizations.instance.getString(StringIds.titleHome)),
        ));
  }
}

class _SettingPageState extends LBaseState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    CustomLocalizations _customLocal = CustomLocalizations.instance;
    return Scaffold(
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

```

[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md

