import 'package:flutter/material.dart';

import '../base_text.dart';

class TitleLargeText extends BaseText {
  const TitleLargeText(
    String text, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textColor,
    super.textKey,
  }) : super(text);

  const TitleLargeText.key(
    String textKey, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textColor,
    super.text,
  }) : super.key(textKey);

  @override
  buildTextStyle(context) => Theme.of(context).textTheme.titleLarge;
}