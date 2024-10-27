library richtext_from_string;

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:richtext_from_string/richtext_options.dart';
export 'package:richtext_from_string/richtext_options.dart';

/// A Calculator.
base class RichTextConverter {
  final List<TextSpan> spans = [];
  final String annotatedText;
  late final RichTextOptions options;
  final Map<String, VoidCallback>? callbacks;

  RichTextConverter(
    this.annotatedText, {
    RichTextOptions? options,
    this.callbacks,
  }) {
    this.options = options ?? RichTextOptions();
  }

  /// Converts an annotated string into a RichText widget with parsed annotations.
  Widget convert({ValueKey? key}) {
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
        matchText = matchText.replaceFirst("**", "");
        matchText = matchText.replaceFirst("**", "");
        spans.add(TextSpan(text: matchText, style: options.boldStyle));
      } else if (matchText.startsWith('*')) {
        // Italic
        matchText = matchText.replaceFirst("*", "");
        matchText = matchText.replaceFirst("*", "");
        spans.add(
          TextSpan(
            text: matchText,
            style: options.italicStyle,
          ),
        );
      } else if (matchText.startsWith('_')) {
        // Underline
        matchText = matchText.replaceFirst("_", "");
        matchText = matchText.replaceFirst("_", "");
        spans.add(
          TextSpan(
            text: matchText,
            style: options.underlineStyle,
          ),
        );
      } else if (matchText.startsWith('[')) {
        // Gesture (Clickable text)
        String displayText = match.group(2)!;
        String actionKey = match.group(3)!;
        spans.add(TextSpan(
          semanticsLabel: actionKey,
          text: displayText,
          style: options.gestureStyle,
          recognizer: TapGestureRecognizer()..onTap = _setOnTap(actionKey),
        ));
      }

      currentIndex = match.end;
    }

    if (currentIndex < annotatedText.length) {
      spans.add(TextSpan(text: annotatedText.substring(currentIndex)));
    }

    return RichText(key: key, text: TextSpan(children: spans));
  }

  VoidCallback? _setOnTap(String actionKey) {
    try {
      if (callbacks != null && callbacks!.containsKey(actionKey)) {
        return callbacks![actionKey];
      }
      return null;
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      return null;
    }
  }
}
