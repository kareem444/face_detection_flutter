import 'package:flutter/material.dart';

class FeedBackWidgetsHelper {
  static snakeBar({
    required BuildContext context,
    required String text,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
