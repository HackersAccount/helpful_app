import 'package:flutter/material.dart';

bool _isZigEditing = false;
bool _isUSDEditing = false;

void onAmountChanged({
  required TextEditingController editedController,
  required TextEditingController otherController,
  required double exchangeRate,
  required bool isEditing,
  required double zigAmount,
  required double usdAmount,
  required TextEditingController zigController,
  required TextEditingController usdController,
}) {
  if (!isEditing) {
    if (editedController.text.isNotEmpty) {
      try {
        final newAmount = double.parse(editedController.text);
        if (editedController == zigController) {
          if (!_isZigEditing) {
            _isUSDEditing = true;
            zigAmount = newAmount;
            usdAmount = newAmount / exchangeRate;
            usdController.text = usdAmount.toStringAsFixed(2);
            _isUSDEditing = false;
          }
        } else {
          if (!_isUSDEditing) {
            _isZigEditing = true;
            usdAmount = newAmount;
            zigAmount = newAmount * exchangeRate;
            zigController.text = zigAmount.toStringAsFixed(2);
            _isZigEditing = false;
          }
        }
      } catch (e) {
        if (editedController == zigController) {
          zigAmount = 0.0;
          usdController.text = '';
        } else {
          usdAmount = 0.0;
          zigController.text = '';
        }
      }
    }
  }
}
