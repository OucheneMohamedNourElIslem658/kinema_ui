import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kinema/commun/constents/colors.dart';
import 'package:pay/pay.dart';

import '../utils/payment_configurations.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton(
      {super.key, required this.paymentItems, this.onPaymentResult});

  final List<PaymentItem> paymentItems;
  final Function(Map<String, dynamic>)? onPaymentResult;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return GooglePayButton(
        paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
        paymentItems: paymentItems,
        type: GooglePayButtonType.buy,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: onPaymentResult,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(
            color: CustomColors.primaryRed,
          ),
        ),
      );
    } else {
      return ApplePayButton(
        paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
        paymentItems: paymentItems,
        style: ApplePayButtonStyle.black,
        type: ApplePayButtonType.buy,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: onPaymentResult,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
