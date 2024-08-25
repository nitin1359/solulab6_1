import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solulab6/custom_f_icon.dart';
import 'package:solulab6/screens/scan_to_pay/paymentsuccess.dart';
import 'package:solulab6/utils/common_widgets.dart';

class Qrpassword extends StatelessWidget {
  final double amount;
  Qrpassword({super.key, required this.amount});

  final RxBool _isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.0738),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customBoxButton(
                  onTap: () {},
                  boxColor: const Color(0xffFFFFFF),
                  icon: CustomFIcon.icon_10,
                  iconColor: const Color(0xff030319),
                ),
                customText(
                  text: 'Confirm Password',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff030319),
                ),
                const SizedBox(
                  height: 40,
                  width: 40,
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0295),
                    customText(
                      text:
                          'Please input your password before\ncontinuing payment',
                      fontSize: 18,
                      color: const Color(0xff8F92A1),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0295),
                    Obx(
                      () => TextField(
                        obscureText: !_isPasswordVisible.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Color(0xff8F92A1), fontSize: 16),
                          helperText: 'Must be at least 8 characters.',
                          helperStyle: const TextStyle(
                              color: Color(0xff8F92A1), fontSize: 14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey[400],
                            ),
                            onPressed: () => _isPasswordVisible.toggle(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF2F2F2)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            wideButton(
              text: 'Confirm Password',
              onTap: () {Get.to(() => Paymentsuccess(amount: amount));},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0295),
          ],
        ),
      ),
    );
  }
}
