[README of English][readme-en]

# fluintl (Flutter 国际化)

[![Pub](https://img.shields.io/pub/v/fluintl.svg?style=flat-square)](https://pub.dartlang.org/packages/fluintl)

fluintl 是一个为应用提供国际化的库，可快速集成实现应用多语言。该库封装了一个国际化支持类，通过提供统一方法getString(id)获取字符串。CustomLocalizations多语言支持类。LBaseState可简洁获取字符串。  

### 关于使用本开源库
如果您是用于公司项目，请随意使用～  
如果您是用于开源项目，未经本人许可，请勿copy源码到您的项目使用！  
使用方式：
```yaml
dependencies:
  fluintl: ^0.1.3  
```

### v0.1.3(2019.03.25)
支持复用。  
替换字符串格式要求：'%\${index}\$s' ，{index} 第几个参数，从0开始。

```
 Ids.click_times: '%\$0\$s点击了%\$1\$s次',   
   
 IntlUtil.getString(context, Ids.click_times, params: ['Tom', '$_counter'])  
 // print: Tom点击了0次
```


### 使用步骤:  
1.创建多语言资源字符串id管理类Ids 和 多语言资源Map
```
///多语言资源id管理类.  
class Ids {  
  static String titleHome = 'title_home'; 
}  
///简单多语言资源.  
Map<String, Map<String, String>> localizedSimpleValues = {  
  'en': {    
    Ids.titleHome: 'Home',  
  },  
  'zh': {    
    Ids.titleHome: '主页',  
  },  
};  
///多语言资源.  
Map<String, Map<String, Map<String, String>>> localizedValues = {  
  'en': {  
    'US': {  
      Ids.titleHome: 'Home',  
    }  
  },  
  'zh': {  
    'CN': {  
      Ids.titleHome: '主页',  
    },  
    'HK': {  
      Ids.titleHome: '主頁',  
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
 IntlUtil.getString(context, Ids.titleHome);
 IntlUtil.getString(context, Ids.titleHome, params: [param1, param2]);　
 CustomLocalizations.of(context).getString(Ids.titleHome)
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
 CustomLocalizations.instance.getString(Ids.titleHome)
 extends or with LBaseState()  (MyHomePageState不能使用)
 cl.getString(Ids.titleHome)
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
setLocalizedSimpleValues(values)                    : 配置简单多语言资源.
setLocalizedValues(values)                          : 配置多语言资源.
CustomLocalizations.delegate                        : 自定义本地化代理.
CustomLocalizations.supportedLocales                : 本地支持的语言环境.
CustomLocalizations.of(context)                     : 获取CustomLocalizations.
getString(id, {languageCode, countryCode, params})  : 通过id获取字符串,可指定languageCode,countryCode.
IntlUtil.getString(context, id, params)             : 通过id获取字符串,可指定languageCode,countryCode.

//不推荐使用
CustomLocalizations.init(context)                   : 自定义本地化代理初始化.(在MyHomePage初始化)
LBaseState (extends or with LBaseState)             : 可方便简洁获取字符串
cl.getString(id).(MyHomePage不能使用)
```

### [Example](./example/lib/main.dart)

### Demo: [flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid).

### APK:[点击下载 v0.1.x](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wanandroid.apk)

### APK QR:
  ![flutter_wanandroid](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_wanandroid/qrcode.png)

## Screenshot
![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_57_58.gif)  

![image](https://github.com/Sky24n/LDocuments/blob/master/AppImgs/flutter_wanandroid/2018-10-12_00_58_49.gif)

### 关于作者
GitHub : [Sky24n](https://github.com/Sky24n)  
简书 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://www.jianshu.com/u/cbf2ad25d33a)  
掘金 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://juejin.im/user/5b9e8a92e51d453df0440422/posts)  
Pub &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://pub.flutter-io.cn/packages?q=email%3A863764940%40qq.com)    
Email &nbsp;&nbsp;: 863764940@qq.com  
如果您觉得本项目不错的话，来个star支持下作者吧!  


[readme]: https://github.com/Sky24n/fluintl
[readme-en]: https://github.com/Sky24n/fluintl/blob/master/README-EN.md




