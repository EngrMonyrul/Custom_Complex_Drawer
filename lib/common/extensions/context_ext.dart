import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
}
