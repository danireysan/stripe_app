import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/helpers/navigate_fade_in.dart';
import 'package:stripe_app/mockups/credit_card_data.dart';
import 'package:stripe_app/pages/card_page.dart';

import '../widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              itemCount: tarjetas.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final tarjeta = tarjetas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      navegarMapaFadeIn(
                        context,
                        CardPage(tarjeta: tarjeta),
                      ),
                    );
                  },
                  child: Hero(
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
                );
              },
            ),
          ),
          const Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      ),
    );
  }
}
