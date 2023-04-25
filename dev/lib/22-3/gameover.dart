// //創建game over組件 用於結束遊戲
// import 'dart:ui';

// import 'package:flame/components.dart';
// import 'package:flutter/material.dart';

// class GameOver extends PositionComponent {
//   @override
//   void render(Canvas canvas) {
//     super.render(canvas);
//     final textStyle = TextStyle(
//       color: Colors.white,
//       fontSize: 50,
//     );
//     final textSpan = TextSpan(
//       text: 'Game Over',
//       style: textStyle,
//     );
//     final textPainter = TextPainter(
//       text: textSpan,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(
//         (size.x - textPainter.width) / 2,
//         (size.y - textPainter.height) / 2,
//       ),
//     );
//   }
// }
