import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solulab6/utils/common_widgets.dart';

class WeeklyIncomeGraph extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyIncomeData;

  const WeeklyIncomeGraph({super.key, required this.weeklyIncomeData});

  @override
  Widget build(BuildContext context) {
    Map<String, double> incomeSourceTotals = {};
    double totalIncome = 0;

    for (var incomeData in weeklyIncomeData) {
      String source = incomeData['source'];
      double amount = incomeData['amount'];

      incomeSourceTotals.update(
        source,
        (existingValue) => existingValue + amount,
        ifAbsent: () => amount,
      );
      totalIncome += amount;
    }

    List<Color> incomeSourceColors = [
      const Color(0xffA259FF),
      const Color(0xffFFCA83),
      const Color(0xff65B0F6),
      const Color(0xffEE8B60),
      const Color(0xff94E8B2),
      const Color(0xffC880F7),
      const Color(0xffFF9797),
      const Color(0xff87CEFF),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              text: 'Last 7 days Income',
              fontSize: 16,
              color: const Color(0xff8F92A1),
            ),
            customText(
              text: '\$${totalIncome.toStringAsFixed(2)}',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xff030319),
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
                painter: IncomeCategoryPainter(
                  categoryValues: incomeSourceTotals.values.toList(),
                  totalValue: totalIncome,
                  colors: incomeSourceColors,
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
          child: Wrap(
            spacing: 16.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: incomeSourceTotals.entries.map((entry) {
              int index = incomeSourceTotals.keys.toList().indexOf(entry.key);
              return categoryIndicator(
                text: entry.key,
                color: incomeSourceColors[index % incomeSourceColors.length],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class IncomeCategoryPainter extends CustomPainter {
  final List<double> categoryValues;
  final double totalValue;
  final List<Color> colors;

  IncomeCategoryPainter({
    required this.categoryValues,
    required this.totalValue,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    double startAngle = -0.5 * 3.14;

    for (int i = 0; i < categoryValues.length; i++) {
      double sweepAngle = (categoryValues[i] / totalValue) * 2 * 3.14;
      paint.color = colors[i % colors.length];

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget categoryIndicator({required String text, required Color color}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
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
      customText(
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    ],
  );
}
