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

A very simple converter using markdown-like syntax to convert an annotated string into a RichText
widget. The package also provides the ability to change the default styling to suit your own
needs. Since the styling for each annotation is fully customisable, you can also ensure that the
annotations don't prevent you from inserting characters.

One very interesting use case is that you don't need to split your translations anymore. This was
necessary if you wanted to achieve different click behaviour and different styling for some parts of
the text. Also, languages are very different. And the order of words is different in each language,
which can force you to rearrange your split translations in your multi-language application, which
is quite annoying.

## Features

String to RichText-Widget conversion.

- *italic*
- **bold**
- _underline_
- \[gesture\]\(callbackName\)

![Shows a preview of the functionality that is available.](./richtext_from_string/assets/preview.png "Package Preview Image")

## Getting started

It is quite easy to use:

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

If it appears, that another annotation will be necessary, feel free to contribute and open up
a pull request. But keep in mind to test your changes and write some unit tests.