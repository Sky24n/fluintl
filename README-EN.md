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



[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md

