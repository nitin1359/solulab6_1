import 'package:flutter/material.dart';
import 'package:solulab6/controller/bottom_nav_controller.dart';
import 'package:solulab6/controller/statistic_controller.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/screens/chart/monthly_chart.dart';
import 'package:solulab6/screens/chart/weekly_chart.dart';
import 'package:solulab6/utils/common_widgets.dart';
import 'package:get/get.dart';
import 'package:solulab6/utils/custom_list_classes.dart';

class StatsScreen extends StatelessWidget {
  final BottomNavController _bottomNavController = Get.find();
  final StatisticController controller = Get.put(StatisticController());

  StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16 + 44),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customBoxButton(
                    onTap: () {
                      _bottomNavController.changeTabIndex(0);
                    },
                    boxColor: const Color(0xffFFFFFF),
                    icon: CustomFIcon.icon_10,
                    iconColor: const Color(0xff030319),
                  ),
                  customText(
                    text: 'Statistic',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff030319),
                  ),
                  customBoxButton(
                    onTap: () {},
                    boxColor: const Color(0xffFFFFFF),
                    iconColor: const Color(0xff030319),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xff105D38),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                            text: 'Income', color: const Color(0xffE0E0E0)),
                        Obx(
                          () => customText(
                            text: controller.selectedView == 'Weekly'
                                ? '\$${controller.weeklyTotalIncome.toStringAsFixed(2)}'
                                : '\$${controller.monthlyTotalIncome.toStringAsFixed(2)}',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 58,
                      width: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.white,
                            Colors.white.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                            text: 'Expense', color: const Color(0xffE0E0E0)),
                        Obx(
                          () => customText(
                            text: controller.selectedView == 'Weekly'
                                ? '\$${controller.weeklyTotalExpense.toStringAsFixed(2)}'
                                : '\$${controller.monthlyTotalExpense.toStringAsFixed(2)}',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<StatisticController>(
                    builder: (controller) {
                      return Container(
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xffF2F2F2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4),
                          child: DropdownButton<String>(
                            value: controller.selectedView,
                            items: controller.viewOptions
                                .map((view) => DropdownMenuItem(
                                      value: view,
                                      child: customText(
                                          text: view,
                                          color: const Color(0xff030319),
                                          fontWeight: FontWeight.w500),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedView = value!;
                              controller.update();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(CustomFIcon.icon_2,
                              size: 24, color: Color(0xff4CD080)),
                          const SizedBox(width: 8),
                          customText(text: 'Income'),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          const Icon(CustomFIcon.icon_1,
                              size: 24, color: Color(0xffFFAE58)),
                          const SizedBox(width: 8),
                          customText(text: 'Expense'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 188,
                child: GetBuilder<StatisticController>(
                  builder: (controller) {
                    return controller.selectedView == 'Monthly'
                        ? MonthlyChart(
                            chartData: controller.monthlyChartData,
                          )
                        : WeeklyChart(
                            chartData: controller.weeklyChartData,
                          );
                  },
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffF2F2F2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: controller.weeklyTotal < 0
                                ? const Color(0xffF2F2F2)
                                : const Color(0xffFFFFFF),
                          ),
                          child: Center(
                            child: customText(
                                text: 'Income',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: controller.weeklyTotal < 0
                                    ? const Color(0xffBDBDBD)
                                    : const Color(0xff105D38)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: controller.weeklyTotal < 0
                                ? const Color(0xffFFFFFF)
                                : const Color(0xffF2F2F2),
                          ),
                          child: Center(
                            child: customText(
                                text: 'Expense',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: controller.weeklyTotal < 0
                                    ? const Color(0xff105D38)
                                    : const Color(0xffBDBDBD)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              customText(
                text: 'Category Chart',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xff030319),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: controller.buildIncomeGraph(),
                // controller.buildCategoryGraph(),
              ),
              const SizedBox(height: 24),
              customText(
                text: 'Recent Expenses',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xff030319),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 146,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: recentExpenses.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  recentExpenses[index]['icon'],
                                  height: 48,
                                  width: 48,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: recentExpenses[index]['name'],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff030319),
                                      ),
                                      const SizedBox(height: 4),
                                      customText(
                                        text:
                                            '${recentExpenses[index]['date']}  •  ${recentExpenses[index]['time']}',
                                        color: const Color(0xff8F92A1),
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ),
                                customText(
                                  text: recentExpenses[index]['amount'] < 0
                                      ? '-\$${recentExpenses[index]['amount'].abs().toStringAsFixed(2)}'
                                      : '\$${recentExpenses[index]['amount'].toStringAsFixed(2)}',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff030319),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
