import 'package:fluintl/src/custom_localizations.dart';
import 'package:flutter/widgets.dart';

/// 推荐使用IntlUtil获取字符串.
class IntlUtil {
  static String getString(BuildContext context, String id,
      {String languageCode, String countryCode}) {
    return CustomLocalizations.of(context)
        .getString(id, languageCode: languageCode, countryCode: countryCode);
  }
}
