import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solulab6/utils/animatedsvg.dart';
import 'package:solulab6/utils/common_widgets.dart';

class Paymentsuccess extends StatelessWidget {
  const Paymentsuccess({super.key, required double amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff105D38),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.1,
            right: 0,
            child: Column(
              children: [
                AnimatedSVG(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.137),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.137),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/images/png/white_pattern.png',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1380 + 407),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: DottedLine(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0738),
                      Align(
                        alignment: Alignment.center,
                        child: customText(
                          text: 'Payment Receipt',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.059), //48px
                      SizedBox(
                        height: 100,
                        child: Image.asset(
                            'assets/images/png/payment_success_tick.png'),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0295), //24px
                      customText(
                        text: 'Payment Success',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0098),

                      customText(
                        text:
                            'Your payment for Starbucks Coffee has\nbeen successfully done',
                        fontSize: 16,
                        color: const Color(0xff8F92A1),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0197), //16px
                      customText(
                        text: 'Total Payment',
                        fontSize: 16,
                        color: const Color(0xff8F92A1),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.0049), //4px
                      customText(
                          text: '\$132.00',
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0197),
                      //16px
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0197),
                      //16px
                      const SizedBox(
                          height:
                              52), // arrage coorect pixels here if necessary
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: 'Payment for'),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0099),
                        Container(
                          height: 81,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/png/starbucks_48.png',
                                  height: 48,
                                ),
                                const SizedBox(width: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: 'Starbucks Coffee',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      customText(
                                        text:
                                            '${DateFormat('MMM d, yyyy').format(DateTime.now())} • ${DateFormat('h:mm a').format(DateTime.now())}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff8F92A1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0295),
                        wideButton(
                          text: 'Done',
                          onTap: () {},
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0295),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: customText(
                              text: 'Pay again',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff105D38),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
