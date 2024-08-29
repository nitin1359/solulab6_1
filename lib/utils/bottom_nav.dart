import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solulab6/screens/navscreens/homescreen.dart';
import 'package:solulab6/screens/navscreens/notificationscreen.dart';
import 'package:solulab6/screens/navscreens/profilescreen.dart';
import 'package:solulab6/screens/navscreens/scanqr.dart';
import 'package:solulab6/screens/navscreens/statsscreen.dart';
import 'package:solulab6/controller/bottom_nav_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());

  CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: PageView(
        controller: _bottomNavController.pageController,
        onPageChanged: (index) {
          _bottomNavController.changeTabIndex(index);
        },
        children: [
          const HomeScreen(),
          StatsScreen(),
          Scanqr(),
          Notificationscreen(),
          const ProfileScreen(),
        ],
      ),
      floatingActionButton: Obx(() {
        // Hide FAB on specific screens, if necessary
        if (_bottomNavController.currentIndex.value == 3) {
          return const SizedBox.shrink();
        } else {
          return Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: FloatingActionButton(
              onPressed: () {
                _bottomNavController.changeTabIndex(2);
              },
              backgroundColor: const Color(0xFFFFAE58),
              shape: const CircleBorder(),
              child: SvgPicture.asset(
                'assets/images/svg/nav3.svg',
                height: 24,
                width: 24,
              ),
            ),
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        // Hide BottomAppBar on specific screens, if necessary
        if (_bottomNavController.currentIndex.value == 3) {
          return const SizedBox.shrink();
        } else {
          return BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 18.0,
            child: SizedBox(
              height: 49,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildNavItem('assets/images/svg/nav1.svg',
                      'assets/images/svg/home_nav.svg', 0),
                  _buildNavItem('assets/images/svg/stats_nav1.svg',
                      'assets/images/svg/nav2.svg', 1),
                  const SizedBox(width: 56), // For FAB space
                  _buildNavItem('assets/images/svg/nav4.svg',
                      'assets/images/svg/nav4.svg', 3),
                  _buildNavItem('assets/images/svg/nav5.svg',
                      'assets/images/svg/nav5.svg', 4),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildNavItem(String svgPath1, String svgPath2, int index) {
    return InkWell(
      onTap: () {
        _bottomNavController.changeTabIndex(index);
      },
      child: Obx(() {
        final isSelected = _bottomNavController.currentIndex.value == index;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? svgPath1 : svgPath2,
              height: 24,
              width: 24,
            ),
          ],
        );
      }),
    );
  }
}
