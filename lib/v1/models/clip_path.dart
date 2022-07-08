import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PathPainterOne extends CustomClipper<ui.Path> {
  @override
  getClip(ui.Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class PathPainterTwo extends CustomClipper<Path> {
  @override
  ui.Path getClip(ui.Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) {
    return true;
  }
}
