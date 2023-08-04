import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../bloc/pagar/pagar_bloc.dart';
import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  static const String routeName = '/card';

  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tarjeta = context.select((PagarBloc bloc) => bloc.state.tarjeta)!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.read<PagarBloc>().add(DeactivateCard());

              Navigator.pop(context);
            },
          ),
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
            const Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
