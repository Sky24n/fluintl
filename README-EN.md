## [README of Chinese][readme]

# fluintl (Flutter Internationalization Package)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl  It is a library that supports internationalization and can be quickly integrated to implement multi-language applications.CustomLocalizations: Multi-language support class。LBaseState: Can get strings concisely。  

set localized values:  
setLocalizedValues(localizedValues).  

specify localizationsDelegates and supportedLocales for MaterialApp:  
MaterialApp(  
   home: MyHomePage(),  
   localizationsDelegates: [  
   GlobalMaterialLocalizations.delegate,  
   GlobalWidgetsLocalizations.delegate,  
   CustomLocalizations.delegate   
   ],  
   supportedLocales: CustomLocalizations.supportedLocales,  
);  
  
For international application, please refer to [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)App。 

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

[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md

