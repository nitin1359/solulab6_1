import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:solulab6/controller/scanner_controller.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/screens/scan_to_pay/scansummary.dart';
import 'package:solulab6/utils/common_widgets.dart';

class Scanqr extends StatelessWidget {
  Scanqr({super.key});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
  );

  final ScannerAnimationController animationController =
      Get.put(ScannerAnimationController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff105D38),
      body: Stack(
        children: [
          Padding(
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
                      text: 'Scan to Pay',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffFFFFFF),
                    ),
                    customBoxButton(
                      onTap: () {},
                      boxColor: const Color(0xff105D38),
                      iconColor: const Color(0xffFFFFFF),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.102),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41.0),
                  child: Image.asset(
                      'assets/images/png/phone_screen_with_scanner_frame.png'),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.703,
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
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 16),
                    customText(
                      text: 'Payment with QR Code',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff030319),
                    ),
                    const SizedBox(height: 8),
                    customText(
                        text:
                            'Hold the code inside the frame, it will be scanned\nautomatically',
                        color: const Color(0xff8F92A1))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3495,
            left: (MediaQuery.of(context).size.width - 200) / 2,
            right: (MediaQuery.of(context).size.width - 200) / 2,
            bottom: MediaQuery.of(context).size.height * 0.39,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    MobileScanner(
                      key: qrKey,
                      controller: controller,
                      onDetect: (capture) {
                        if (capture.barcodes.isNotEmpty) {
                          final barcode = capture.barcodes.first;
                          Get.to(() => Scansummary(
                              qrCodeData: barcode.rawValue ?? '',
                            ),);
                          
                        }
                      },
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SizedBox(
                        height: 200,
                        width: 250,
                        child: GetX<ScannerAnimationController>(
                          builder: (controller) {
                            return TweenAnimationBuilder<double>(
                              tween: Tween(
                                  begin: controller.animationValue.value,
                                  end:
                                      controller.isForward.value ? 170.0 : 0.0),
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInOut,
                              onEnd: () {
                                controller.animate();
                              },
                              builder: (context, value, child) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 250,
                                    height: 4,
                                    color: const Color(0xff4CD080),
                                    margin: EdgeInsets.only(top: value),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
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
