import 'package:flutter/material.dart';

class AmountController {
  final TextEditingController editedController;
  final TextEditingController otherController;
  final double exchangeRate;
  late bool _isEditing;
  late bool _isOtherEditing;

  AmountController({
    required this.editedController,
    required this.otherController,
    required this.exchangeRate,
  }) {
    _isEditing = false;
    _isOtherEditing = false;
    editedController.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    if (!_isEditing) {
      final text = editedController.text;
      if (text.isNotEmpty) {
        try {
          final newAmount = double.parse(text);
          _isEditing = true;
          if (editedController == otherController) {
            _updateOther(newAmount);
          } else {
            _updateEdited(newAmount);
          }
          _isEditing = false;
        } catch (e) {
          // Handle parsing error
          _handleParsingError();
        }
      }
    }
  }

  void _updateOther(double newAmount) {
    if (!_isOtherEditing) {
      _isEditing = true;
      final usdAmount = newAmount;
      final zigAmount = newAmount * exchangeRate;
      editedController.text = usdAmount.toStringAsFixed(2);
      otherController.text = zigAmount.toStringAsFixed(2);
      _isEditing = false;
    }
  }

  void _updateEdited(double newAmount) {
    if (!_isEditing) {
      _isOtherEditing = true;
      final zigAmount = newAmount;
      final usdAmount = newAmount / exchangeRate;
      editedController.text = zigAmount.toStringAsFixed(2);
      otherController.text = usdAmount.toStringAsFixed(2);
      _isOtherEditing = false;
    }
  }

  void _handleParsingError() {
    // Handle parsing error
    editedController.text = '0.00';
    otherController.text = '';
  }

  void dispose() {
    editedController.removeListener(_onAmountChanged);
  }
}
