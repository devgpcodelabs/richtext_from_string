import 'package:flutter/material.dart';
import 'package:richtext_from_string/richtext_from_string.dart';

class PrivacyTermsCheckbox extends StatefulWidget {
  @override
  _PrivacyTermsCheckboxState createState() => _PrivacyTermsCheckboxState();
}

class _PrivacyTermsCheckboxState extends State<PrivacyTermsCheckbox> {
  bool _isChecked = false;
  late final String text;

  @override
  void initState() {
    super.initState();
    text =
        "I have read and agree to the [Privacy Policy](policy) and [Terms of Service](tos). I understand that by agreeing, I am consenting to the processing of my personal data in accordance with the Privacy Policy and accept the conditions outlined in the [Terms of Service](tos).";
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.3),
      child: CheckboxListTile(
        title: RichTextConverter(
          text,
          options: RichTextOptions(
            gestureStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline),
          ),
        ).convert(
          callbacks: {
            "policy": () => Navigator.of(context).pushNamed("/privacy_policy"),
            "tos": () => Navigator.of(context).pushNamed("/terms_of_service"),
          },
        ),
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value ?? false;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
