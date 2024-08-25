import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerAnimationController extends GetxController {
  final RxDouble animationValue = 0.0.obs;
  final RxBool isForward = true.obs;

  void animate() {
    if (isForward.value) {
      animationValue.value = 196.0;
    } else {
      animationValue.value = 0.0;
    }
    isForward.toggle();
  }
}


class ScanSummaryController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  var showAllCards = false.obs; // Observable to track card visibility
  var amount = 0.0.obs; // Observable to store the amount

  void toggleCardVisibility() {
    showAllCards.value = !showAllCards.value;
  }

  void onAmountChanged(String value) {
    // Remove any existing '$' and update the amount variable
    amount.value = double.tryParse(value.replaceAll('\$', '')) ?? 0.0;

    // Update the text field with the formatted amount
    if (!value.startsWith('\$')) {
      final newText = '\$${value.replaceAll('\$', '')}';
      amountController.value = amountController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}