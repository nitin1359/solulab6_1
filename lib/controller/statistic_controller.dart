import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solulab6/screens/chart/weekly_category_graph.dart';

class StatisticController extends GetxController {
  final RxString _selectedView = 'Weekly'.obs;
  String get selectedView => _selectedView.value;
  set selectedView(String value) => _selectedView.value = value;

  final List<String> viewOptions = ['Weekly', 'Monthly'];

  final List<Map<String, dynamic>> weeklyChartData = [
    {'day': 'Mon', 'income': 100.0, 'expense': 200.0},
    {'day': 'Tue', 'income': 200.0, 'expense': 100.0},
    {'day': 'Wed', 'income': 150.0, 'expense': 80.0},
    {'day': 'Thu', 'income': 120.0, 'expense': 300.0},
    {'day': 'Fri', 'income': 100.0, 'expense': 100.0},
    {'day': 'Sat', 'income': 180.0, 'expense': 70.0},
    {'day': 'Sun', 'income': 150.0, 'expense': 200.0},
  ];

  final List<Map<String, dynamic>> monthlyChartData = [
    {'week': 'Week 1', 'income': 1200.0, 'expense': 400.0},
    {'week': 'Week 2', 'income': 1000.0, 'expense': 600.0},
    {'week': 'Week 3', 'income': 1800.0, 'expense': 700.0},
    {'week': 'Week 4', 'income': 1500.0, 'expense': 200.0},
  ];

  final RxDouble _weeklyTotalIncome = 0.0.obs;
  double get weeklyTotalIncome => _weeklyTotalIncome.value;
  set weeklyTotalIncome(double value) => _weeklyTotalIncome.value = value;

  final RxDouble _weeklyTotalExpense = 0.0.obs;
  double get weeklyTotalExpense => _weeklyTotalExpense.value;
  set weeklyTotalExpense(double value) => _weeklyTotalExpense.value = value;

  final RxDouble _monthlyTotalIncome = 0.0.obs;
  double get monthlyTotalIncome => _monthlyTotalIncome.value;
  set monthlyTotalIncome(double value) => _monthlyTotalIncome.value = value;

  final RxDouble _monthlyTotalExpense = 0.0.obs;
  double get monthlyTotalExpense => _monthlyTotalExpense.value;
  set monthlyTotalExpense(double value) => _monthlyTotalExpense.value = value;

  final RxDouble _totalIncome = 0.0.obs;
  double get totalIncome => _totalIncome.value;
  set totalIncome(double value) => _totalIncome.value = value;

  final RxDouble _totalExpense = 0.0.obs;
  double get totalExpense => _totalExpense.value;
  set totalExpense(double value) => _totalExpense.value = value;

  final RxDouble _total = 0.0.obs;
  double get total => _total.value;
  set total(double value) => _total.value = value;

  final RxDouble _weeklyTotal = 0.0.obs;
  double get weeklyTotal => _weeklyTotal.value;
  set weeklyTotal(double value) => _weeklyTotal.value = value;

  final RxDouble _monthlyTotal = 0.0.obs;
  double get monthlyTotal => _monthlyTotal.value;
  set monthlyTotal(double value) => _monthlyTotal.value = value;

  @override
  void onInit() {
    super.onInit();
    calculateTotals();
  }

  void calculateTotals() {
    weeklyTotalIncome =
        weeklyChartData.fold(0, (sum, item) => sum + item['income']);
    weeklyTotalExpense =
        weeklyChartData.fold(0, (sum, item) => sum + item['expense']);
    monthlyTotalIncome =
        monthlyChartData.fold(0, (sum, item) => sum + item['income']);
    monthlyTotalExpense =
        monthlyChartData.fold(0, (sum, item) => sum + item['expense']);
    totalIncome = weeklyTotalIncome + monthlyTotalIncome;
    totalExpense = weeklyTotalExpense + monthlyTotalExpense;
    total = totalIncome - totalExpense;
    weeklyTotal = weeklyTotalIncome - weeklyTotalExpense;
    monthlyTotal = monthlyTotalIncome - monthlyTotalExpense;
  }

  void updateSelectedView(String view) {
    selectedView = view;
  }

  Widget buildCategoryGraph() {
    return WeeklyCategoryGraph(weeklyData: weeklyChartData);
  }

  Rx<double> getTotalIncome() {
    return Rx<double>(
        selectedView == 'Weekly' ? weeklyTotalIncome : monthlyTotalIncome);
  }

  Rx<double> getTotalExpense() {
    return Rx<double>(
        selectedView == 'Weekly' ? weeklyTotalExpense : monthlyTotalExpense);
  }
}
