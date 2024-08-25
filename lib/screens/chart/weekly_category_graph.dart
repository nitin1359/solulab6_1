import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeeklyCategoryGraph extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyData;

  const WeeklyCategoryGraph({super.key, required this.weeklyData});

  @override
  Widget build(BuildContext context) {
    double transportation = 0;
    double shopping = 0;
    double coffee = 0;
    double total = 0;

    for (var day in weeklyData) {
      double expense = day['expense'];
      total += expense;
      if (weeklyData.indexOf(day) % 3 == 0) {
        transportation += expense;
      } else if (weeklyData.indexOf(day) % 3 == 1) {
        shopping += expense;
      } else {
        coffee += expense;
      }
    }

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: CategoryPainter(
              transportation: transportation / total,
              shopping: shopping / total,
              coffee: coffee / total,
            ),
          ),
          Center(
            child: SvgPicture.asset('assets/images/svg/coffee.svg'),
          ),
        ],
      ),
    );
  }
}

class CategoryPainter extends CustomPainter {
  final double transportation;
  final double shopping;
  final double coffee;

  CategoryPainter({
    required this.transportation,
    required this.shopping,
    required this.coffee,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    // Orange
    paint.color = const Color(0xffFFAE58);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5 * 3.14,
      transportation * 2 * 3.14,
      false,
      paint,
    );

    // Shopping
    paint.color = const Color(0xff4CD080);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      transportation * 2 * 3.14 - 0.5 * 3.14,
      shopping * 2 * 3.14,
      false,
      paint,
    );

    // Coffee
    paint.color = const Color(0xff105D38);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      (transportation + shopping) * 2 * 3.14 - 0.5 * 3.14,
      coffee * 2 * 3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
