import 'package:flutter/material.dart';

/// [RichTextOptions]
/// Defines default styles applicable to the generated text spans.
/// [basicStyle] defines the styling of the non-annotated text spans.
/// [boldStyle] defines the styling of the bold-annotated text spans.
/// [italicStyle] defines the styling of the italic-annotated text spans.
/// [underlineStyle] defines the styling of the underline-annotated text spans.
/// [gestureStyle] defines the styling of the gesture-annotated text spans.
class RichTextOptions {
  late final TextStyle basicStyle;
  late final TextStyle boldStyle;
  late final TextStyle italicStyle;
  late final TextStyle underlineStyle;
  late final TextStyle gestureStyle;

  RichTextOptions({
    TextStyle? basicStyle,
    TextStyle? boldStyle,
    TextStyle? italicStyle,
    TextStyle? underlineStyle,
    TextStyle? gestureStyle,
  }) {
    this.basicStyle = basicStyle ?? _defaultBasicStyle;
    this.boldStyle = boldStyle ?? _defaultBoldStyle;
    this.italicStyle = italicStyle ?? _defaultItalicStyle;
    this.underlineStyle = underlineStyle ?? _defaultUnderlineStyle;
    this.gestureStyle = gestureStyle ?? _defaultGestureStyle;
  }

  TextStyle get _defaultGestureStyle => const TextStyle(color: Colors.blue);

  TextStyle get _defaultUnderlineStyle =>
      const TextStyle(decoration: TextDecoration.underline);

  TextStyle get _defaultItalicStyle =>
      const TextStyle(fontStyle: FontStyle.italic);

  TextStyle get _defaultBoldStyle =>
      const TextStyle(fontWeight: FontWeight.bold);

  TextStyle get _defaultBasicStyle => const TextStyle();
}
