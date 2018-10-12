[README of English][readme-en]

# fluintl (Flutter 国际化)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl 是一个应用国际化支持的库，可快速集成实现应用多语言。CustomLocalizations多语言支持类。LBaseState可简洁获取字符串。  

配置多语言资源:  
setLocalizedValues(localizedValues).  

在MaterialApp指定localizationsDelegates和supportedLocales:  
MaterialApp(
   home: MyHomePage(),
   localizationsDelegates: [
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   CustomLocalizations.delegate
      ],
   supportedLocales: CustomLocalizations.supportedLocales,
);
应用国际化具体使用可参考[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)App。 

### Add dependency
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter  
  fluintl: x.x.x  #latest version
```

### APIs
```
setLocalizedSimpleValues(values)            : 配置简单多语言资源.
setLocalizedValues(values)                  : 配置多语言资源.
CustomLocalizations.delegate                : 自定义本地化代理.
CustomLocalizations.supportedLocales        : 本地支持的语言环境.
CustomLocalizations.init(context)           : 自定义本地化代理初始化.(在MyHomePage初始化)
CustomLocalizations.of(context)             : 获取CustomLocalizations.
getString(id, {languageCode, countryCode})  : 通过id获取字符串,可指定languageCode,countryCode.
LBaseState (extends or with LBaseState)     : 可方便简洁获取字符串cl.getString(id).(MyHomePage不能使用)
```

### Example
``` dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluintl/fluintl.dart';

class _MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();
//    setLocalizedSimpleValues(localizedSimpleValues);
    setLocalizedValues(localizedValues);
//    _locale = new Locale('en', 'US');//指定语言为English
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
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //HomePage init.
    CustomLocalizations.init(context);
    ...
  }
}

Text(CustomLocalizations.of(context).getString(StringIds.titleSetting)),
Text(CustomLocalizations.instance.getString(StringIds.titleSetting)),
Text(_customLocal.getString(StringIds.titleSetting)),
Text(cl.getString(StringIds.titleSetting)),
Text(cl.getString(StringIds.titleSetting, languageCode: 'en', countryCode: 'US')),
Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'CN')),
Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'HK')),
Text(cl.getString(StringIds.titleSetting, languageCode: 'zh', countryCode: 'TW')),
```

### Demo: [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid).

### APK:[点击下载 v0.0.2](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)

### APK QR:
  ![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)

## Screenshot
![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_57_58.gif)  

![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_58_49.gif)



[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md




