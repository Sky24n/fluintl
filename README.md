[README of English][readme-en]

# fluintl (Flutter 国际化)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl 是一个为应用提供国际化的库，可快速集成实现应用多语言。该库封装了一个国际化支持类，通过提供统一方法getString(id)获取字符串。CustomLocalizations多语言支持类。LBaseState可简洁获取字符串。  
使用步骤:  
1.创建多语言资源字符串id管理类StringIds 和 多语言资源Map
```
///多语言资源id管理类.  
class StringIds {  
  static String titleHome = 'title_home';  
}  
///简单多语言资源.  
Map<String, Map<String, String>> localizedSimpleValues = {  
  'en': {    
    StringIds.titleHome: 'Home',  
  },  
  'zh': {    
    StringIds.titleHome: '主页',  
  },  
};  
///多语言资源.  
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
2.在MyApp initState配置多语言资源(可配置通用或简单多语言资源,二选一)
```
  void initState() {    
    super.initState();      
//    setLocalizedSimpleValues(localizedSimpleValues);//配置简单多语言资源  
    setLocalizedValues(localizedValues); //配置多语言资源      
  }   
```
3.在MaterialApp指定localizationsDelegates和supportedLocales:
```
MaterialApp(  
   home: MyHomePage(),  
   localizationsDelegates: [  
   GlobalMaterialLocalizations.delegate,  
   GlobalWidgetsLocalizations.delegate,  
   CustomLocalizations.delegate //设置本地化代理     
   ],  
   supportedLocales: CustomLocalizations.supportedLocales,//设置支持本地化语言集合     
);  
```
4.字符串获取
```
 IntlUtil.getString(context, StringIds.titleHome);　
 CustomLocalizations.of(context).getString(StringIds.titleHome)
```
5.其他(不推荐使用)
```
 //在主页初始化.
 class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    CustomLocalizations.init(context);
    ...
  }

 // 字符串获取
 CustomLocalizations.instance.getString(StringIds.titleHome)
 extends or with LBaseState()  (MyHomePageState不能使用)
 cl.getString(StringIds.titleHome)
```
6.应用国际化详细使用请参考[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)App。  
Q：Flutter国际化系统切换iOS不生效问题？  
A：在Xcode项目Localizations下添加支持语言即可，[原文](https://stanzhai.site/blog/post/stanzhai/Flutter国际化设置在iOS设备上不生效的问题)。

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
CustomLocalizations.of(context)             : 获取CustomLocalizations.
getString(id, {languageCode, countryCode})  : 通过id获取字符串,可指定languageCode,countryCode.
IntlUtil.getString(context, id)             : 通过id获取字符串,可指定languageCode,countryCode.

//不推荐使用
CustomLocalizations.init(context)           : 自定义本地化代理初始化.(在MyHomePage初始化)
LBaseState (extends or with LBaseState)     : 可方便简洁获取字符串
cl.getString(id).(MyHomePage不能使用)
```

### Example
```
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluintl/fluintl.dart';

///多语言资源id管理类.
class StringIds {
  static String titleHome = 'title_home';
}
///简单多语言资源.
Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    StringIds.titleHome: 'Home',
  },
  'zh': {
    StringIds.titleHome: '主页',
  },
};
///多语言资源.
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
//    setLocalizedSimpleValues(localizedSimpleValues);//配置简单多语言资源
    setLocalizedValues(localizedValues);//配置多语言资源
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
        CustomLocalizations.delegate //设置本地化代理
      ],
      supportedLocales: CustomLocalizations.supportedLocales,//设置支持语言
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //在主页初始化.
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

### Demo: [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid).

### APK:[点击下载 v0.1.1](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)

### APK QR:
  ![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)

## Screenshot
![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_57_58.gif)  

![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_58_49.gif)



[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md




