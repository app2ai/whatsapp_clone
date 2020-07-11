import 'dart:math';
import 'package:flutter/material.dart';

class ClipChatMessage extends CustomClipper<Path>{
  final double chatRadius;
  ClipChatMessage(this.chatRadius);

  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, chatRadius);
    final r = chatRadius;
    final angle = 0.785;
    path.conicTo(
      r - r * sin(angle),
      r + r * cos(angle),
      r - r * sin(angle * 0.5),
      r + r * cos(angle * 0.5),
      1,
    );

    final moveIn = 2 * r; // need to be > 2 * r
    path.lineTo(moveIn, r + moveIn * tan(angle));

    path.lineTo(moveIn, size.height - chatRadius);

    path.conicTo(
      moveIn + r - r * cos(angle),
      size.height - r + r * sin(angle),
      moveIn + r,
      size.height,
      1,
    );

    path.lineTo(size.width*0.8, size.height);
    path.lineTo(size.width*0.8, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

}