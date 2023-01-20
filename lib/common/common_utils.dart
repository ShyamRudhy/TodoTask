import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'colors.dart';

class CommonUtils {
  static showSuccessSnackbar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  static showErrorSnackbar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  static loadingIndicator(BuildContext context) {
    return const LoadingIndicator(
      indicatorType: Indicator.lineSpinFadeLoader,

      /// Required, The loading type of the widget
      colors: [ACCENT_COLOR],

      /// Optional, The color collections
      strokeWidth: 2,

      /// Optional, The stroke of the line, only applicable to widget which contains line
      backgroundColor: Colors.transparent,

      /// Optional, Background of the widget
      pathBackgroundColor: Colors.white,

      /// Optional, the stroke backgroundColor
    );
  }
}
