import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:richtext_from_string/richtext_from_string.dart';

void main() {
  group("test", () {
    testWidgets('Italic text parsing', (WidgetTester tester) async {
      String input = "This is an *italic* word.";
      Widget result = RichTextConverter(input).convert();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: result)));

      TextSpan span = (result as RichText).text as TextSpan;
      InlineSpan italicSpan = span.children![1];

      expect(italicSpan.style!.fontStyle, FontStyle.italic);
    });
    testWidgets('Bold text parsing', (WidgetTester tester) async {
      String input = "This is a **bold** word.";
      Widget result = RichTextConverter(input).convert();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: result)));

      TextSpan span = (result as RichText).text as TextSpan;
      InlineSpan boldSpan = span.children![1];

      expect(boldSpan.style!.fontWeight, FontWeight.bold);
    });

    testWidgets('Underline text parsing', (WidgetTester tester) async {
      String input = "This is an _underlined_ word.";
      Widget result = RichTextConverter(input).convert();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: result)));

      TextSpan span = (result as RichText).text as TextSpan;
      InlineSpan underlineSpan = span.children![1];

      expect(underlineSpan.style!.decoration, TextDecoration.underline);
    });

    testWidgets('Gesture recognizer parsing', (WidgetTester tester) async {
      String input = "Click [here](navigate) to proceed.";
      bool callbackInvoked = false;
      Map<String, VoidCallback> callbacks = {
        'navigate': () {
          callbackInvoked = true;
        },
      };
      RichTextConverter converter = RichTextConverter(input);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ...converter.spans.asMap().entries.map((entry) =>
                    RichText(key: ValueKey(entry.key), text: entry.value)),
              ],
            ),
          ),
        ),
      );

      converter.spans.asMap().entries.forEach((entry) {
        expect(find.byKey(ValueKey(entry.key)), findsOneWidget);
      });

      await tester.tap(find.byKey(const ValueKey(1)));
      expect(callbackInvoked, isTrue);
    });

    testWidgets('Combined styles parsing', (WidgetTester tester) async {
      String input =
          "This is *italic*, **bold**, _underlined_, and [clickable](action) text.";
      bool actionInvoked = false;
      Map<String, VoidCallback> callbacks = {
        'action': () {
          actionInvoked = true;
        },
      };
      RichTextConverter converter = RichTextConverter(input);
      Widget result = converter.convert(callbacks: callbacks);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ...converter.spans.asMap().entries.map((entry) =>
                    RichText(key: ValueKey(entry.key), text: entry.value)),
              ],
            ),
          ),
        ),
      );

      TextSpan span = (result as RichText).text as TextSpan;

      converter.spans.asMap().entries.forEach((entry) {
        expect(find.byKey(ValueKey(entry.key)), findsOneWidget);
      });

      InlineSpan italicSpan = span.children![1];
      InlineSpan boldSpan = span.children![3];
      InlineSpan underlineSpan = span.children![5];
      // clickableSpan has index 7!

      expect(italicSpan.style!.fontStyle, FontStyle.italic);
      expect(boldSpan.style!.fontWeight, FontWeight.bold);
      expect(underlineSpan.style!.decoration, TextDecoration.underline);

      await tester.tap(find.byKey(const ValueKey(7)));
      expect(actionInvoked, isTrue);
    });
  });
}
