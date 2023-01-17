# Easy Typography
A easy way to use typography in flutter

![tests](https://github.com/louis-kevin/easy-typography/actions/workflows/tests.yaml/badge.svg)
## Features

* Use Text Theme Styled Text with widgets, no need to pass context
* Use Locale Keys instead of texts

## Getting started
You can start using just passing the text to one of the text widgets.
```dart
import 'package:easy_typography/easy_typography.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BodyLargeText('my text')
    );
  }
}
```



## Usage

### Widget names
Since we use the same names from the flutter [TextTheme](https://api.flutter.dev/flutter/material/TextTheme-class.html) class, you can just use the same name.<br>
We have the following widgets:
* DisplayLargeText
* DisplayMediumText
* DisplaySmallText
* HeadlineMediumText
* HeadlineSmallText
* TitleLargeText
* TitleMediumText
* TitleSmallText
* BodyLargeText
* BodyMediumText
* BodySmallText
* LabelLargeText
* LabelSmallText

### Parameters
We also use the same parameters as the widget [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) from 'package:flutter/material.dart', so if you need to customize, just pass the parameters as usual

### Fit
You can use the parameter fit, passing a [BoxFit](https://api.flutter.dev/flutter/painting/BoxFit.html) enum. When passing, the text will be wrapped by a [FittedBox](https://api.flutter.dev/flutter/widgets/FittedBox-class.html) class

### Locale
You can use your locale using the parameter `textKey` or using the constructor `DisplayLargeText.key`.<br>
```dart
import 'package:easy_typography/easy_typography.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: DisplayLargeText.key('my_key')
    );
  }
}
```

To configure your locale, you need to implement the class `TextLocale`, using the method `localize` as your way to localize your text:<br>

```dart 
class MyLocale extends TextLocale {
  @override
  String localize(String key) {
    return testText;
  }
}
```

After that you just need to pass to your class to our singleton `BaseTextLocale` before you application starts:
```dart 
import 'package:easy_typography/easy_typography.dart';

BaseTextLocale().setLocale(Locale());}
```

## Additional information

Since this package uses the [Text](https://api.flutter.dev/flutter/material/TextTheme-class.html) be warned that if this class changes, the widgets names might change as well!
