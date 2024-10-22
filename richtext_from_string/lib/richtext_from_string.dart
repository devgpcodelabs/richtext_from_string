library richtext_from_string;

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/// A Calculator.
base class RichTextConverter {
  final List<TextSpan> spans = [];
  final String annotatedText;

  RichTextConverter(this.annotatedText);

  /// Converts an annotated string into a RichText widget with parsed annotations.
  Widget convert({Map<String, VoidCallback>? callbacks, ValueKey? key}) {
    final RegExp pattern =
        RegExp(r'(\*\*[^*\s][^*]*\*\*|\*[^*\s][^*]*\*|_[^_\s][^_]*_|'
            r'\[([^\]]+)\]\(([^)]+)\))');
    int currentIndex = 0;

    Iterable<RegExpMatch> matches = pattern.allMatches(annotatedText);

    for (final match in matches) {
      if (match.start > currentIndex) {
        spans.add(
            TextSpan(text: annotatedText.substring(currentIndex, match.start)));
      }

      String matchText = match.group(0)!;

      if (matchText.startsWith('**')) {
        // Bold
        spans.add(TextSpan(
            text: matchText,
            style: const TextStyle(fontWeight: FontWeight.bold)));
      } else if (matchText.startsWith('*')) {
        // Italic
        spans.add(TextSpan(
            text: matchText,
            style: const TextStyle(fontStyle: FontStyle.italic)));
      } else if (matchText.startsWith('_')) {
        // Underline
        spans.add(TextSpan(
            text: matchText,
            style: const TextStyle(decoration: TextDecoration.underline)));
      } else if (matchText.startsWith('[')) {
        // Gesture (Clickable text)
        String displayText = match.group(2)!;
        String actionKey = match.group(3)!;
        spans.add(TextSpan(
          semanticsLabel: actionKey,
          text: displayText,
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = callbacks != null ? callbacks[actionKey] : null,
        ));
      }

      currentIndex = match.end;
    }

    if (currentIndex < annotatedText.length) {
      spans.add(TextSpan(text: annotatedText.substring(currentIndex)));
    }

    return RichText(key: key, text: TextSpan(children: spans));
  }
}
