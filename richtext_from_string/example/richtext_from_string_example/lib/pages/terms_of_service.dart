import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms of Service",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "1. Acceptance of Terms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "By accessing and using this app, you agree to be bound by these Terms of Service. "
                "If you do not agree, you may not use this app.",
              ),
              SizedBox(height: 16),
              Text(
                "2. User Obligations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "You agree not to misuse the services provided. This includes, but is not limited to, "
                "attempting to access restricted areas, tampering with code, or engaging in activities that "
                "may harm the platform or other users.",
              ),
              SizedBox(height: 16),
              Text(
                "3. Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Your privacy is important to us. Please review our Privacy Policy to understand how we "
                "collect, use, and protect your data.",
              ),
              SizedBox(height: 16),
              Text(
                "4. Modifications to Terms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We may modify these Terms of Service at any time. Changes will be effective immediately "
                "upon posting. Continued use of the app constitutes acceptance of the new terms.",
              ),
              SizedBox(height: 16),
              Text(
                "5. Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions about these Terms of Service, please contact us at support@example.com.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
