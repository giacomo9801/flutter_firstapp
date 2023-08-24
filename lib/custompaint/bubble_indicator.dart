import 'dart:math';
// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_firstapp/pages/theme.dart';

class BubbleIndicator extends CustomPainter {
  //coordinate dove disegnare la bolla
  final Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  BubbleIndicator(
      {this.dxTarget = 120,
      this.dxEntry = 26,
      this.radius = 25,
      this.dy = 25,
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
//disegna l'arco sx
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, pi);
//disegna il rettangolo (bisogna trovare le coordinate giuste)
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    //disegna l'arco dx
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, pi);

    //gestione della bolla in base al pulsante
    final pos = pageController.position;
    final fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);
    final pageOffset = pos.extentBefore / fullExtent;
//movimento della bolla
    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, CustomTheme.gradientStart, 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  //impostandola a true, ogni volta che viene chiamato il metodo paint, viene ridisegnato il widget
}
