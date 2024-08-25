// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/utils/banner.dart';
import 'package:solulab6/utils/common_widgets.dart';
import 'package:solulab6/utils/custom_list_classes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 64,
                        height: 38,
                        child: Center(
                          child: Image.asset(
                            'assets/images/png/logo.png',
                          ),
                        ),
                      ),
                      customBoxButton(
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: 'Hello Andre,',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff030319),
                        ),
                        const SizedBox(height: 4),
                        customText(
                          text: 'Your available balance',
                          color: const Color(0xff8F92A1),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        customText(
                          text: '\$15,901',
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0xff4CD080),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customTopMenu(
                          text: 'Transfer',
                          icon: CustomFIcon.icon_27,
                          onTap: () {},
                        ),
                        customTopMenu(
                          text: 'Top Up',
                          icon: CustomFIcon.icon_26,
                          onTap: () {},
                        ),
                        customTopMenu(
                          text: 'History',
                          icon: CustomFIcon.icon_25,
                          onTap: () {},
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 25,
                  child: customText(
                      text: 'Payment List',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(menuItems.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Blank onPressed method for now
                      },
                      child: SizedBox(
                        height: 84,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFF6FAFD),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: SvgPicture.asset(
                                  menuItems[index].imagePath,
                                  height: 24,
                                  width: 24),
                            ),
                            SizedBox(height: 8),
                            customText(text: menuItems[index].label),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                      text: 'Promo & Discount',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: customText(
                        text: 'See More',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4CD080),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: BannerScreen(),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
