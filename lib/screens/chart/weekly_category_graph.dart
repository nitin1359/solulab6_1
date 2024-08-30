import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solulab6/controller/statistic_controller.dart';
import 'package:solulab6/utils/common_widgets.dart';

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

    Map<String, Color> categoryColors = {};
    for (var day in weeklyData) {
      if (weeklyData.indexOf(day) % 3 == 0) {
        categoryColors['Transportation'] = const Color(0xffFFAE58);
      } else if (weeklyData.indexOf(day) % 3 == 1) {
        categoryColors['Shopping'] = const Color(0xff4CD080);
      } else {
        categoryColors['Coffee'] = const Color(0xff105D38);
      }
    }

    final StatisticController controller = Get.find();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
                text: 'Last 7 days expenses',
                fontSize: 16,
                color: const Color(0xff8F92A1)),
            Obx(
              () => customText(
                text: controller.weeklyTotal < 0
                    ? '-\$${controller.weeklyTotal.abs().toStringAsFixed(2)}'
                    : '\$${controller.weeklyTotal.toStringAsFixed(2)}',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xff030319),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
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
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categoryColors.entries.map((entry) {
              return categoryIndicator(
                text: entry.key,
                color: entry.value,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

Widget categoryIndicator({required String text, required Color color}) {
  return Row(
    children: [
      Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(width: 8),
      Text(text),
    ],
  );
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
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    // Orange (Transportation)
    paint.color = const Color(0xffFFAE58);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5 * 3.14,
      transportation * 2 * 3.14,
      false,
      paint,
    );

    // Green (Shopping)
    paint.color = const Color(0xff4CD080);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      transportation * 2 * 3.14 - 0.5 * 3.14,
      shopping * 2 * 3.14,
      false,
      paint,
    );

    // Dark Green (Coffee)
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

