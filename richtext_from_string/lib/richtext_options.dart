import 'package:flutter/material.dart';

class RichTextOptions {
  late final TextStyle boldStyle;
  late final TextStyle italicStyle;
  late final TextStyle underlineStyle;
  late final TextStyle gestureStyle;

  RichTextOptions({
    TextStyle? boldStyle,
    TextStyle? italicStyle,
    TextStyle? underlineStyle,
    TextStyle? gestureStyle,
  }) {
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
}
