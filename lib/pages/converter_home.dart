import 'package:flutter/material.dart';

import '../components/convertor_card.dart';
import '../utils/amount_change.dart';

class ConverterHomePage extends StatefulWidget {
  const ConverterHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConverterHomePageState createState() => _ConverterHomePageState();
}

class _ConverterHomePageState extends State<ConverterHomePage> {
  final double _zigAmount = 0.0;
  final double _usdAmount = 0.0;
  final double _exchangeRate = 13.56;

  final _zigController = TextEditingController();
  final _usdController = TextEditingController();

  bool _isZigEditing = false;
  bool _isUSDEditing = false;

  @override
  void initState() {
    super.initState();
    _zigController.addListener(_onZIGAmountChanged);
    _usdController.addListener(_onUSDAmountChanged);
  }

  @override
  void dispose() {
    _zigController.dispose();
    _usdController.dispose();
    super.dispose();
  }

  void _onZIGAmountChanged() {
    onAmountChanged(
      editedController: _zigController,
      otherController: _usdController,
      exchangeRate: _exchangeRate,
      isEditing: _isZigEditing,
      zigAmount: _zigAmount,
      usdAmount: _usdAmount,
      zigController: _zigController,
      usdController: _usdController,
    );
    _isUSDEditing = _isZigEditing;
  }

  void _onUSDAmountChanged() {
    onAmountChanged(
      editedController: _usdController,
      otherController: _zigController,
      exchangeRate: _exchangeRate,
      isEditing: _isUSDEditing,
      zigAmount: _zigAmount,
      usdAmount: _usdAmount,
      zigController: _zigController,
      usdController: _usdController,
    );
    _isZigEditing = _isUSDEditing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZIG to USD Converter'),
      ),
      body: Center(
        child: ConverterCard(
          zigController: _zigController,
          usdController: _usdController,
          onZIGAmountChanged: _onZIGAmountChanged,
          onUSDAmountChanged: _onUSDAmountChanged,
          elevation: 16.0,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
