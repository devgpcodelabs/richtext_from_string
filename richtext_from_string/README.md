<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

A very simple converter using markdown like syntax to convert an annotated string
into a RichText-Widget. The package also offers the ability to change the default styling to 
match your custom needs.

## Features

String to RichText-Widget conversion.

- *italic*
- **bold**
- _underline_
- \[gesture\]\(callbackName\)

![image info](./richtext_from_string/assets/preview.png)


## Getting started

It is quite easy to use the converter:

```dart

RichTextConverter converter = RichTextConverter(input);
Widget richText = converter.convert(callbacks: callbacks);
```

If you want to apply your custom styles you can pass an instance of `RichTextOptions`:

```dart
RichTextOptions options = RichTextOptions(
  boldStyle: const TextStyle(
      fontSize: 32, fontWeight: FontWeight.w900),
  italicStyle: const TextStyle(
      fontSize: 22, fontStyle: FontStyle.italic),
  gestureStyle:
  const TextStyle(fontSize: 10, color: Colors.red),
  underlineStyle: const TextStyle(
      fontSize: 24, decoration: TextDecoration.lineThrough),
);
RichTextConverter converter = RichTextConverter(input, options: options);
Widget richText = converter.convert(callbacks: callbacks);
```
That's all to say for now.

## Usage

Head on to [GitHub]() to have a look at the example.

## Additional information

Feel free to contribute if you like. But keep in mind to test your changes and add
some tests.