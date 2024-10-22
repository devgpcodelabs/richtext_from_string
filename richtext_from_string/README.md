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

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

I want to build a Flutter package that helps me with converting strings into rich-text widgets.
That means, that strings need to be annotated to build different widgets from it. To keep things
simple, the annotation syntax should be similar to the markdown syntax. 
Remember, spaces should not be styles! Here is an example:

Example 1 - Italic Text:
String italicText = "Only a single *word* is in italic style".

The expected result of Example 1 should be:
```dart

Text.rich(TextSpan(
      children: [
        TextSpan(text: "Only a single "),
        TextSpan(text: "*word*", style: TextStyle(fontStyle: FontStyle.italic)),
        TextSpan(text: " is in italic style"),
      ],
    ))

```

Example 2 - Bold Text:
String boldText = "Only a single **word** is in italic style".

The expected result of Example 2 should be:

```dart

Text.rich(TextSpan(
      children: [
        TextSpan(text: "Only a single "),
        TextSpan(text: "**word**", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: " is in bold style"),
      ],
    ));

```

Example 3 - Underlined Text:
String boldText = "Only a single **word** is in italic style".

The expected result of Example 2 should be:

```dart
Text.rich(TextSpan(
children: [
TextSpan(text: "Only a single "),
TextSpan(text: "_word_", style: TextStyle(decoration: TextDecoration.underline)),
TextSpan(text: " is underlined"),
],
));

```

And so on. 
What is missing is a good implementation on how gestures could be handled in this system. E.g.
a text could be underlined and the user want's to navigate to an other page on clicking on this text.
Those text parts need also a good annotation and a way that one can inject callbacks.