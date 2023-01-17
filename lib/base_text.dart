import 'package:easy_typography/locale.dart';
import 'package:flutter/material.dart';

import 'typography/body_large_text.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyLargeText('my text'));
  }
}

abstract class BaseText extends StatelessWidget {
  final BoxFit? fit;
  final String? text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? textColor;
  final String? textKey;

  const BaseText(
    this.text, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textColor,
    this.textKey,
    this.fit,
  });

  const BaseText.key(
    this.textKey, {
    super.key,
    this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textColor,
    this.fit,
  });

  TextStyle? buildTextStyle(context);

  String buildText() {
    var finalText = text;

    if (text == null && textKey != null) {
      finalText = BaseTextLocale().localize(textKey!);
    }

    if (finalText == null) {
      throw 'Text need a text or textKey';
    }

    return finalText;
  }

  getTextStyle(context) {
    TextStyle? textStyle = style;
    TextStyle baseTextStyle = buildTextStyle(context) ?? const TextStyle();
    if (textColor != null && textStyle == null) {
      textStyle = TextStyle(color: textColor);
    }

    return baseTextStyle.merge(textStyle);
  }

  @override
  Widget build(BuildContext context) {
    var textWidget = buildTextWidget(context);

    if (fit != null) return FittedBox(fit: fit!, child: textWidget);

    return textWidget;
  }

  buildTextWidget(context) {
    return Text(
      buildText(),
      style: getTextStyle(context),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}
