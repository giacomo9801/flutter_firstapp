import 'dart:ui';

import 'package:flutter/material.dart';

class BubbleIndicator extends CustomPainter {
  //coordinate dove disegnare la bolla
  final Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  BubbleIndicator(
      {this.dxTarget = 125,
      this.dxEntry = 4,
      this.radius = 30,
      this.dy = 35,
      required this.pageController})
      : painter = Paint()
          //elementi riempiti di bianco
          ..color = Colors.white
          ..style = PaintingStyle.fill,
        super(repaint: pageController);

  @override
  void paint(Canvas canvas, Size size) {
    final entry = Offset(dxEntry, dy);
    final target = Offset(dxTarget, dy);

    final path = Path();
//disegna il rettangolo (bisogna trovare le coordinate giuste)
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  //impostandola a true, ogni volta che viene chiamato il metodo paint, viene ridisegnato il widget
}
