import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solulab6/controller/scanner_controller.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/screens/scan_to_pay/qrpassword.dart';
import 'package:solulab6/utils/common_widgets.dart';
import 'package:intl/intl.dart';
import 'package:solulab6/utils/custom_list_classes.dart';

class Scansummary extends StatelessWidget {
  final String qrCodeData;

  Scansummary({super.key, required this.qrCodeData});

  final ScanSummaryController controller = Get.put(ScanSummaryController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/png/summary_screen.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.074),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customBoxButton(
                        onTap: () {},
                        boxColor: const Color(0xff105D38),
                        icon: CustomFIcon.icon_10,
                        iconColor: const Color(0xffFFFFFF),
                      ),
                      customText(
                        text: 'Summary Transaction',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffFFFFFF),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff105D38),
                            border: Border.all(
                              color: const Color(0xffC4C4C4),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                'assets/images/svg/help.svg',
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0566),
                  Image.asset(
                    'assets/images/png/starbucks_big.png',
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: screenHeight * 0.0197),
                  customText(
                    text: 'Starbucks Coffee',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  ),
                  SizedBox(height: screenHeight * 0.0099),
                  customText(
                    text:
                        'Payment on ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffFFAE58),
                  ),
                  SizedBox(height: screenHeight * 0.0493),
                  Container(
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: TextField(
                        controller: controller.amountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: '\$0.00',
                          hintStyle: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: controller.onAmountChanged,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0197),
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/svg/info_icon.svg'),
                          const SizedBox(width: 8),
                          customText(
                              text: 'Payment fee \$2 has been applied',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFFFFFF)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Positioned(
              top: controller.showAllCards.value
                  ? MediaQuery.of(context).size.height * 0.55
                  : MediaQuery.of(context).size.height * 0.6796,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.0197),
                      Center(
                        child: Container(
                          height: 5,
                          width: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.0197),
                      customText(
                        text: 'Choose Cards',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff030319),
                      ),
                      SizedBox(height: screenHeight * 0.0197),
                      Obx(
                        () => Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/png/logo.png',
                                    height: 40,
                                    width: 48,
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: creditCards[0].cardName,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      customText(
                                        text: creditCards[0].cardNumber,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff8F92A1),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      controller.showAllCards.value
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                    ),
                                    onPressed: controller.toggleCardVisibility,
                                  ),
                                ],
                              ),
                            ),
                            if (controller.showAllCards.value)
                              Column(
                                children: creditCards
                                    .skip(1)
                                    .map(
                                      (card) => Container(
                                        padding: const EdgeInsets.all(16.0),
                                        margin:
                                            const EdgeInsets.only(top: 16.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/png/logo.png',
                                              height: 40,
                                              width: 48,
                                            ),
                                            const SizedBox(width: 16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                customText(
                                                  text: card.cardName,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                customText(
                                                  text: card.cardNumber,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff8F92A1),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0296),
                      wideButton(
                        text: 'Proceed to Pay',
                        onTap: () {
                          Get.off(() =>
                              Qrpassword(amount: controller.amount.value));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
