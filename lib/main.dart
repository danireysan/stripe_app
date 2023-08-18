import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/pages/complete_payment.dart';
import 'package:stripe_app/pages/home_page.dart';
import 'package:stripe_app/services/stripe_service.dart';

import 'bloc/pagar/pagar_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    StripeService().init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PagarBloc()),
      ],
      child: MaterialApp(
        title: 'Stripe app',
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          CompletePaymentPage.routeName: (context) =>
              const CompletePaymentPage(),
        },
        initialRoute: HomePage.routeName,
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xff284879),
          scaffoldBackgroundColor: const Color(0xff21232A),
        ),
      ),
    );
  }
}
