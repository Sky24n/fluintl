## [README of Chinese][readme]

# fluintl (Flutter Internationalization Package)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl It is an international library for applications that can be quickly integrated to implement multi-language applications. 
The library encapsulates an internationalization support class that obtains a string by providing a uniform method getString(id). 
CustomLocalizations multi-language support class. LBaseState can get strings neatly.  

### v0.1.3(2019.03.25)
multiplexing。  
Replacement String Format Requirements：'%\${index}\$s' ，{index} The nth parameter, starting at 0。

```
 Ids.click_times: '%\$0\$s click on %\$1\$s times',
   
 IntlUtil.getString(context, Ids.click_times, params: ['Tom', '$_counter'])

 // print: Tom click on 0 times
```

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
4.get String
```
IntlUtil.getString(context, StringIds.titleHome);
IntlUtil.getString(context, Ids.titleHome, params: [param1, param2]);　
CustomLocalizations.of(context).getString(StringIds.titleHome)
```


4.at MyHomePage init CustomLocalizations:  //There may be problems that are not recommended.
``` dart
class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    CustomLocalizations.init(context); //MyHomePageState init.
    ...
  }
}
```
5.Other(do not recommended use)
```
// MyHomePage init CustomLocalizations
class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    CustomLocalizations.init(context);
    ...
  }
}

//getString
CustomLocalizations.instance.getString(StringIds.titleHome)
extends or with LBaseState()  (MyHomePageState can not use)
cl.getString(StringIds.titleHome)
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
setLocalizedSimpleValues(values)                    : set localized simple values.
setLocalizedValues(values)                          : set localized values.
CustomLocalizations.delegate                        : CustomLocalizations.
CustomLocalizations.supportedLocales                : supported locales.
CustomLocalizations.of(context)                     : get CustomLocalizations.
getString(id, {languageCode, countryCode, params})  : get string by id,Can be specified languageCode,countryCode.
IntlUtil.getString(context, id, params)             : get string by id,Can be specified languageCode,countryCode.

// do not recommended use
CustomLocalizations.init(context)                   : CustomLocalizations init.(MyHomePage init)
LBaseState (extends or with LBaseState)             : It is convenient and concise to get the string
cl.getString(id). (MyHomePage cannot be used)
```

### [Example](./example/lib/main.dart)


[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md

