import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/models/credit_card_model.dart';

import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  static const String routeName = '/card';
  final TarjetaCredito tarjeta;
  const CardPage({super.key, required this.tarjeta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: tarjeta.cardNumber,
              child: CreditCardWidget(
                cardNumber: tarjeta.cardNumberHidden,
                expiryDate: tarjeta.expiracyDate,
                cardHolderName: tarjeta.cardHolderName,
                cvvCode: tarjeta.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (p0) {},
              ),
            ),
            Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
