import 'package:flutter/cupertino.dart';

class ConstantsWidget {
  static Text logo({
    double? fontSize = 48,
    FontWeight? fontWeight = FontWeight.w200,
    Color? color,
  }) {
    return Text(
      "Atendy",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? const Color(0xFFFFFFFF),
        fontFamily: "Kaushan Script",
      ),
    );
  }
}
