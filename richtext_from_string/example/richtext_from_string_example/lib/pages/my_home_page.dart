import 'package:flutter/material.dart';
import 'package:richtext_from_string/richtext_converter.dart';
import 'package:richtext_from_string_example/widgets/custom_card.dart';
import 'package:richtext_from_string_example/widgets/privacy_checkbox.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Wrap(
        children: <Widget>[
          CustomCard(
            title: "Basic usage:",
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: RichTextConverter(
                "This is *italic*, **bold**, _underlined_, and [clickable](action) text. *Even _here **it is **working** [right](action2)?",
                callbacks: {
                  'action': () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog.adaptive(
                            title: Text("You clicked the text!"),
                          );
                        });
                  },
                  'action2': () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog.adaptive(
                          title: Text("And again!"),
                        );
                      },
                    );
                  },
                },
              ).convert(),
            ),
          ),
          CustomCard(
            title: "Apply different styles:",
            child: Builder(
              builder: (context) {
                String text =
                    """This is *italic*, **bold**, _underline as line through_, and [clickable](action) text. Even here it is **working** [right](action2)?""";
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: RichTextConverter(
                    text,
                    options: RichTextOptions(
                      boldStyle: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w900),
                      italicStyle: const TextStyle(
                          fontSize: 22, fontStyle: FontStyle.italic),
                      gestureStyle:
                          const TextStyle(fontSize: 10, color: Colors.red),
                      underlineStyle: const TextStyle(
                          fontSize: 24, decoration: TextDecoration.lineThrough),
                    ),
                  ).convert(),
                );
              },
            ),
          ),
          CustomCard(
              title: "Simply build a legals checkbox:",
              child: PrivacyTermsCheckbox()),
        ],
      ),
    );
  }
}
