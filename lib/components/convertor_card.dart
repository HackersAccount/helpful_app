import 'package:flutter/material.dart';
import 'currency_input.dart';
import 'logo.dart';

class ConverterCard extends StatelessWidget {
  final TextEditingController zigController;
  final TextEditingController usdController;
  final Function() onZIGAmountChanged;
  final Function() onUSDAmountChanged;
  final EdgeInsets margin;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;

  const ConverterCard({
    super.key,
    required this.zigController,
    required this.usdController,
    required this.onZIGAmountChanged,
    required this.onUSDAmountChanged,
    this.margin = const EdgeInsets.all(16.0),
    this.elevation = 4.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // Define phone screen dimensions
    const double phoneWidth = 375.0; // iPhone 11 width
    const double phoneHeight = 812.0; // iPhone 11 height

    // Calculate scale factor based on screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scaleFactorWidth = screenWidth / phoneWidth;
    final double scaleFactorHeight = screenHeight / phoneHeight;
    final double scaleFactor = scaleFactorWidth < scaleFactorHeight
        ? scaleFactorWidth
        : scaleFactorHeight;

    return Transform.scale(
      scale: scaleFactor,
      child: SizedBox(
        width: phoneWidth,
        height: phoneHeight,
        child: Card(
          margin: margin,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: screenHeight * 0.25 * scaleFactorHeight,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: LogoWidget(),
                ),
              ),
              CurrencyInputField(
                controller: zigController,
                labelText: 'Enter ZIG Amount',
                onChanged: onZIGAmountChanged,
                valueKey: 'zig_input',
              ),
              const SizedBox(
                height: 10.0,
              ),
              CurrencyInputField(
                controller: usdController,
                labelText: 'Enter USD Amount',
                onChanged: onUSDAmountChanged,
                valueKey: 'usd_input',
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Convert ZIG to USD and vice versa!',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Current exchange rate: 1 USD = 13.56 ZIG.",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
