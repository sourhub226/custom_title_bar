<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

<!-- Mention use of windowmanager functions in main.dart. and then the installation of the package -->

## Usage

<!-- give default implememtaion here -->

The `CustomTitleBar` widget is a `PreferredSizeWidget`. The default implementation is to use it in the `AppBar` of the `Scaffold`.

```dart
Scaffold(
  appBar: CustomTitleBar(
    title: 'My App',
  ),
);
```

## Parameters

- `title` (required) - The title of the window.
- `backgroundColor` (optional) - The background color of the title bar.
- `foregroundColor` (optional) - The foreground color of the text and icons on the title bar.
- `leading` (optional) - The widget to display on the left side of the title.
- `size` (optional) - The height of the title bar.

## Variations

<!-- give code snippets and output. mention a case where it can be used as a simple widget wrapped in a row/column/container. -->

## License

This package is licensed under the MIT License. See the `LICENSE` file for details.
