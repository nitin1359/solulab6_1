import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class AnimatedSVG extends StatelessWidget {
  final controller = Get.put(AnimationController());

  AnimatedSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationController>(
      init: controller,
      builder: (_) {
        return CustomPaint(
          painter: AnimatedSVGPainter(controller.animationValue),
          child: const SizedBox(width: 361, height: 118),
        );
      },
    );
  }
}

class AnimationController extends GetxController {
  double animationValue = 0.0;

  @override
  void onInit() {
    super.onInit();
    animateValue();
  }

  void animateValue() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 16)); // ~60 FPS
      animationValue += 0.016;
      if (animationValue > 1) animationValue = 0;
      update();
    }
  }
}

class AnimatedSVGPainter extends CustomPainter {
  final double animationValue;

  AnimatedSVGPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Path 1
    paint.color = const Color(0xFFF78E1E);
    var path = Path()
      ..moveTo(2.0335, 0)
      ..cubicTo(1.5335, 13, 6.4335, 41.9, 30.0335,
          53.5 + 5 * math.sin(animationValue * 2 * math.pi))
      ..cubicTo(41.0335, 58.9068, 61.7941, 60.055, 78.5335, 71)
      ..cubicTo(91.5335, 79.5, 96.8668, 92.8333, 97.0335, 96)
      ..cubicTo(97.0335, 99.8333, 98.4335, 108.7, 104.034, 113.5);
    canvas.drawPath(path, paint);

    // Path 2
    paint.color = const Color(0xFF4CD080);
    path = Path()
      ..moveTo(110.533, 0)
      ..cubicTo(115.2, 7.5, 125.033, 23.9, 127.033,
          29.5 + 3 * math.cos(animationValue * 2 * math.pi))
      ..cubicTo(129.533, 36.5, 128.769, 47.7937, 128.033, 50)
      ..cubicTo(127.233, 52.4, 127.033, 55, 123.033, 60)
      ..cubicTo(115.472, 69.4514, 108.533, 79.8, 108.533, 81);
    canvas.drawPath(path, paint);

    // Path 3
    paint.color = const Color(0xFF54B948);
    path = Path()
      ..moveTo(248.533, 0)
      ..cubicTo(247.033, 4, 242.033, 12.5, 232.533, 18)
      ..cubicTo(224.933, 22.4, 207.033, 19.5, 198.033, 20.5)
      ..cubicTo(189.033, 21.5, 183.533, 31.5, 182.033, 34.5)
      ..cubicTo(179.574, 39.4181, 178.689, 42.5405, 178.033, 48)
      ..cubicTo(176.533, 60.5, 176.231, 82.7503, 178.533, 91.5)
      ..cubicTo(181.033, 101, 181.033, 117.5, 181.033, 117.5);
    canvas.drawPath(path, paint);

    // Path 4
    paint.color = const Color(0xFFF78E1F);
    path = Path()
      ..moveTo(205.033, 0)
      ..cubicTo(205.033, 2.66667, 207.733, 9.3, 216.533, 12.5)
      ..cubicTo(226.533, 14, 236.033, 15, 237.533, 15)
      ..cubicTo(239.033, 15, 244.033, 16, 244.033, 16);
    canvas.drawPath(path, paint);

    // Path 5
    paint.color = const Color(0xFF26BCD7);
    paint.strokeWidth = 2;
    path = Path()
      ..moveTo(361.534, 0.5)
      ..cubicTo(352.367, 13.5, 345.534, 24, 330.034, 42.5)
      ..cubicTo(327.321, 45.7379, 324.034, 47, 321.034, 48.5)
      ..cubicTo(315.254, 51.39, 303.034, 51, 297.034, 52)
      ..cubicTo(291.034, 53, 288.914, 55.9448, 288.034, 58)
      ..cubicTo(286.534, 61.5, 286.534, 64.5, 287.034, 67.5)
      ..cubicTo(287.28, 68.9796, 288.1, 71.3999, 289.034, 73)
      ..cubicTo(292.534, 79, 299.534, 87, 299.534, 87);
    canvas.drawPath(path, paint);

    // Path 6
    path = Path()
      ..moveTo(296.033, 90)
      ..cubicTo(296.033, 90, 296.593, 94.2401, 295.033, 94.5)
      ..cubicTo(292.033, 95, 287.033, 96, 287.033, 99);
    canvas.drawPath(path, paint);

    // Triangles
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFF78E1E);
    canvas.drawPath(
        Path()
          ..moveTo(302.23, 57)
          ..lineTo(311.23, 62.1962)
          ..lineTo(302.23, 67.3923)
          ..close(),
        paint);

    canvas.drawPath(
        Path()
          ..moveTo(81.2296, 57)
          ..lineTo(90.2296, 62.1962)
          ..lineTo(81.2296, 67.3923)
          ..close(),
        paint);

    paint.color = const Color(0xFFFF3F3F);
    canvas.drawPath(
        Path()
          ..moveTo(253.632, 50.5)
          ..lineTo(258.132, 53.0981)
          ..lineTo(253.632, 55.6962)
          ..close(),
        paint);

    // Rectangles
    paint.color = const Color(0xFFFF3F3F);
    canvas.drawRect(const Rect.fromLTWH(300.033, 33, 7, 5), paint);
    paint.color = const Color(0xFF26BCD6);
    canvas.drawRect(const Rect.fromLTWH(233.033, 28.8333, 6, 4.1667), paint);
    paint.color = const Color(0xFFC4C4C4);
    canvas.drawRect(const Rect.fromLTWH(163.033, 11.8333, 5, 4.1667), paint);
    paint.color = const Color(0xFFFF3F3F);
    canvas.drawRect(const Rect.fromLTWH(25.0334, 66.8333, 6, 4.1667), paint);

    // Circles
    paint.color = const Color(0xFF26BCD7);
    canvas.drawCircle(const Offset(286.533, 21.5), 1.5, paint);
    paint.color = const Color(0xFF54B948);
    canvas.drawCircle(const Offset(279.533, 73.5), 2.5, paint);
    paint.color = const Color(0xFF26BCD7);
    canvas.drawRect(const Rect.fromLTWH(143.033, 4, 4, 4), paint);
    canvas.drawCircle(const Offset(99.0334, 12), 2, paint);

    // Additional paths
    paint.color = const Color(0xFFFFD2A6);
    paint.style = PaintingStyle.stroke;
    path = Path()
      ..moveTo(77.0335, 38)
      ..cubicTo(76.7002, 39.5, 76.5335, 43.1667, 79.0335, 44)
      ..cubicTo(80.5335, 44.5, 87.0335, 45, 88.0335, 49.5);
    canvas.drawPath(path, paint);

    path = Path()
      ..moveTo(203.533, 29.5)
      ..cubicTo(203.533, 29.5, 203.533, 33.5, 201.533, 34)
      ..cubicTo(199.533, 34.5, 197.781, 34.1066, 196.033, 35)
      ..cubicTo(194.558, 35.7543, 193.533, 37, 193.533, 38);
    canvas.drawPath(path, paint);

    // Add subtle animations to some elements
    canvas.save();
    canvas.translate(0, 2 * math.sin(animationValue * 2 * math.pi));
    paint.color = const Color(0xFF26BCD7);
    canvas.drawCircle(const Offset(286.533, 21.5), 1.5, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(2 * math.cos(animationValue * 2 * math.pi), 0);
    paint.color = const Color(0xFF54B948);
    canvas.drawCircle(const Offset(279.533, 73.5), 2.5, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 2), 
      painter: DottedLinePainter(color: const Color(0xFFE0E0E0)),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const dashWidth = 4.0;
    const dashSpace = 4.0;

    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
