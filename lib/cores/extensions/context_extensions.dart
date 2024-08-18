import 'package:connectiq_alkaff_pretest/cores/extensions/media_query_extensions.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  /// Check that there is Material widget at the root page level
  bool hasMaterialAncestor() {
    final ancestor = findAncestorWidgetOfExactType<Material>();
    if (ancestor != null) return true;
    return false;
  }

  double heightInPercent(double percent) {
    final height = this.height * (percent / 100);
    return height;
  }

  double widthInPercent(double percent) {
    final width = this.width * (percent / 100);
    return width;
  }

  /// check if keyboard is visible
  bool isKeyboardVisible() {
    return bottomViewInset == 0 || !FocusScope.of(this).hasFocus;
  }

  bool hasBottomNotch() {
    final hasBottomNotch = mediaQueryViewPadding.bottom > 0;
    return hasBottomNotch;
  }
}
