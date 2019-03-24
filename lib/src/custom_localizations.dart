import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// localizedSimpleValues exapmle.
/// Map<String, Map<String, String>> _localizedSimpleValues = {
///   'en': {
///     'ok': 'OK',
///   },
///   'zh': {
///     'ok': '确定',
///   },
/// };
Map<String, Map<String, String>> _localizedSimpleValues = {};

/// localizedValues exapmle.
/// Map<String, Map<String, Map<String, String>>> _localizedValues = {
///   'en': {
///     'US': {
///       'ok': 'OK',
///     }
///   },
///   'zh': {
///     'CN': {
///       'ok': '确定',
///     },
///     'HK': {
///       'ok': '確定',
///     },
///     'TW': {
///       'ok': '確定',
///     }
///   }
/// };
Map<String, Map<String, Map<String, String>>> _localizedValues = {};

/// set localized simple values.
/// 配置简单多语言资源.
void setLocalizedSimpleValues(
    Map<String, Map<String, String>> localizedValues) {
  _localizedSimpleValues = localizedValues;
}

/// set localized values.
/// 配置多语言资源.
void setLocalizedValues(
    Map<String, Map<String, Map<String, String>>> localizedValues) {
  _localizedValues = localizedValues;
}

/// CustomLocalizations.
/// 自定义本地化支持.
class CustomLocalizations {
  CustomLocalizations(this.locale);

  Locale locale;

  static CustomLocalizations instance;

  ///不推荐使用.
  static void init(BuildContext context) {
    instance = of(context);
  }

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  /// get string by id,Can be specified languageCode,countryCode.
  /// 通过id获取字符串,可指定languageCode,countryCode.
  String getString(String id,
      {String languageCode, String countryCode, List<Object> params}) {
    String value;
    String _languageCode = languageCode ?? locale.languageCode;
    if (_localizedSimpleValues.isNotEmpty) {
      value = _localizedSimpleValues[_languageCode][id];
    } else {
      String _countryCode = countryCode ?? locale.countryCode;
      if (_countryCode == null ||
          _countryCode.isEmpty ||
          !_localizedValues[_languageCode].keys.contains(_countryCode)) {
        _countryCode = _localizedValues[_languageCode].keys.toList()[0];
      }
      value = _localizedValues[_languageCode][_countryCode][id];
    }
    if (params != null && params.isNotEmpty) {
      for (int i = 0, length = params.length; i < length; i++) {
        value = value?.replaceAll('%\$$i\$s', '${params[i]}');
      }
    }
    return value;
  }

  /// supported Locales
  /// 支持的语言
  static Iterable<Locale> supportedLocales = _getSupportedLocales();

  static List<Locale> _getSupportedLocales() {
    List<Locale> list = new List();
    if (_localizedSimpleValues.isNotEmpty) {
      _localizedSimpleValues.keys.forEach((value) {
        list.add(new Locale(value, ''));
      });
    } else {
      _localizedValues.keys.forEach((value) {
        _localizedValues[value].keys.forEach((vv) {
          list.add(new Locale(value, vv));
        });
      });
    }
    return list;
  }

  static const LocalizationsDelegate<CustomLocalizations> delegate =
      _CustomLocalizationsDelegate();
}

class _CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const _CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => (_localizedSimpleValues.isNotEmpty
      ? _localizedSimpleValues.keys.contains(locale.languageCode)
      : _localizedValues.keys.contains(locale.languageCode));

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return new SynchronousFuture<CustomLocalizations>(
        new CustomLocalizations(locale));
  }

  @override
  bool shouldReload(_CustomLocalizationsDelegate old) => false;
}
