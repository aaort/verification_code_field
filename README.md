## Important

**This package is only tested on Android and iOS**

This package is aimed to provide simple way vor verification code input.

Carefully read available props and functionalities to be able to decide
whether this package is what you are looking for or not.
In case you need more advanced features you can take a look at [Flutter_Pinput](https://github.com/Tkko/Flutter_Pinput.git) and [pin_code_fields](https://github.com/adar2378/pin_code_fields.git)

## Features

Create verification code field with custom look and behavior.

- Provide custom header widget to be displayed above the field
- Customize cells to look the way that is required by your design

## Getting started

- Add package to your dependencies in your `pubspec.yaml` file.
- Run `flutter pug get`.
- Import it in you file like this: `import 'package:verification_code_field:verification_code_field.dart';`

And you're good to go...

## Usage

The only required prop is `length`, here is a minimal example that you can copy and paste inside your project

```dart
VerificationCodeField(
    length: 4,
    obSubmit: () => print('Submitted'),
    //...
)
```

## Additional information

I'm open to contributions and suggestions, in case of issues you can DM me or open a new issue
