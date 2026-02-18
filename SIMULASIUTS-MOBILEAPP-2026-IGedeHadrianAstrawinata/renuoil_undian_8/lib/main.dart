import 'package:flutter/material.dart';
import 'pages/signup_pages.dart';
import 'pages/nameform_pages.dart';
import 'pages/buyerseller_pages.dart';
import 'pages/howdidyouknow_pages.dart';
import 'pages/addressform_pages.dart';
import 'pages/sellerinquiry_pages.dart';

void main() {
  runApp(const ReNuOilApp());
}

class ReNuOilApp extends StatelessWidget {
  const ReNuOilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReNuOil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5A623)),
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignupPage(),
        '/name': (context) => const NameFormPage(),
        '/buyer-seller': (context) => const BuyerSellerFormPage(),
        '/how-did-you-know': (context) => const HowDidYouKnowPage(),
        '/address': (context) => const AddressFormPage(),
        '/seller-inquiry': (context) => const SellerInquiryPage(),
      },
    );
  }
}
