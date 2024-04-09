import 'package:flutter/material.dart';

class CurrencyInputField<T> extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function() onChanged;
  final String valueKey;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final bool autocorrect;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CurrencyInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.valueKey,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.validator,
    this.padding = const EdgeInsets.all(0.0),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.textStyle,
    this.decoration,
    this.autocorrect = true,
    this.maxLength,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 2.0,
      child: TextField(
        key: Key(valueKey),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        style: textStyle,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: contentPadding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontSize: 12.0),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (_) => onChanged,
        autocorrect: autocorrect,
        maxLength: maxLength,
        textInputAction: textInputAction,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}
