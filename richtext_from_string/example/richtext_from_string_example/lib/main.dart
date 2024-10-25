import 'package:flutter/material.dart';
import 'package:richtext_from_string_example/pages/my_home_page.dart';
import 'package:richtext_from_string_example/pages/privacy_policy.dart';
import 'package:richtext_from_string_example/pages/terms_of_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichtText from String Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF090326)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RichText from String Demo'),
      routes: {
        "/terms_of_service": (context) => const TermsOfServicePage(),
        "/privacy_policy": (context) => const PrivacyPolicyPage(),
      },
    );
  }
}
