import 'package:flutter/material.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/utils/common_widgets.dart';
import 'package:solulab6/utils/custom_list_classes.dart';
import 'package:get/get.dart';
import 'package:solulab6/controller/bottom_nav_controller.dart';

class Notificationscreen extends StatelessWidget {
  Notificationscreen({super.key});
  final BottomNavController _bottomNavController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/png/background.png'),
          Column(
            children: [
              const SizedBox(height: 16 + 44),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customBoxButton(
                        onTap: () {
                          _bottomNavController.changeTabIndex(0);
                        },
                        boxColor: const Color(0xff105D38),
                        icon: CustomFIcon.icon_10,
                        iconColor: Colors.white,
                      ),
                      customText(
                        text: 'Notification',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      customBoxButton(
                        onTap: () {},
                        boxColor: const Color(0xff105D38),
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 81 + 44,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        height: 5,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: 'TODAY',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8F92A1),
                        ),
                        customText(
                          text: 'Mark as read',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4CD080),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    todayContainer(),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 20,
                      child: customText(
                          text: 'YESTERDAY',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8F92A1)),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 23.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      notificationItems[index].imagePath,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                            text:
                                                notificationItems[index].title,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                          const SizedBox(height: 4),
                                          customText(
                                            text: notificationItems[index].time,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff4CD080)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: customText(
                                              text:
                                                  notificationItems[index].tag),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 20,
                      child: customText(
                          text: 'LAST 7 DAYS',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8F92A1)),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        final adjustedIndex = index + 4;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 23.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      notificationItems[adjustedIndex]
                                          .imagePath,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                            text:
                                                notificationItems[adjustedIndex]
                                                    .title,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                          const SizedBox(height: 4),
                                          customText(
                                            text:
                                                notificationItems[adjustedIndex]
                                                    .time,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff4CD080)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: customText(
                                              text: notificationItems[
                                                      adjustedIndex]
                                                  .tag),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
