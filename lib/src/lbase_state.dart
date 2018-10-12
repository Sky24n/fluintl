import 'package:fluintl/src/custom_localizations.dart';
import 'package:flutter/widgets.dart';

abstract class LBaseState<T extends StatefulWidget> extends State<T> {
  CustomLocalizations cl = CustomLocalizations.instance;

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    cl = CustomLocalizations.instance;
  }
}
