import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "1. Introduction",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We are committed to protecting your privacy. This policy outlines the data we collect, "
                "how we use it, and the measures we take to safeguard it.",
              ),
              SizedBox(height: 16),
              Text(
                "2. Information Collection",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We collect personal information when you use our app, including but not limited to, "
                "your name, email address, and usage data. This information helps us provide a better "
                "user experience.",
              ),
              SizedBox(height: 16),
              Text(
                "3. Use of Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "The information we collect is used to improve our services, personalize user experience, "
                "and communicate updates. We do not share your personal data with third parties without your consent.",
              ),
              SizedBox(height: 16),
              Text(
                "4. Data Security",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We employ industry-standard security measures to protect your data from unauthorized access, "
                "disclosure, or destruction. However, no online system is completely secure.",
              ),
              SizedBox(height: 16),
              Text(
                "5. Changes to Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We may update this Privacy Policy from time to time. We will notify users of any significant "
                "changes by posting the new policy here.",
              ),
              SizedBox(height: 16),
              Text(
                "6. Contact Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions about our Privacy Policy, please contact us at privacy@example.com.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
