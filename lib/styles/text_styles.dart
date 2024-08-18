import 'package:flutter/material.dart';

extension StyledText<T extends Text> on T {
  Text copyWith({
    String? data,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
  }) =>
      Text(
        data ?? this.data ?? "",
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        textDirection: textDirection ?? this.textDirection,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );

  T textStyle(TextStyle? style) => copyWith(
        style: (this.style ?? const TextStyle()).copyWith(
          background: style?.background,
          backgroundColor: style?.backgroundColor,
          color: style?.color,
          debugLabel: style?.debugLabel,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          fontFeatures: style?.fontFeatures,
          fontSize: style?.fontSize,
          fontStyle: style?.fontStyle,
          fontWeight: style?.fontWeight,
          foreground: style?.foreground,
          height: style?.height,
          inherit: style?.inherit,
          letterSpacing: style?.letterSpacing,
          locale: style?.locale,
          shadows: style?.shadows,
          textBaseline: style?.textBaseline,
          wordSpacing: style?.wordSpacing,
        ),
      ) as T;

  T textScale(double scaleFactor) =>
      copyWith(textScaleFactor: scaleFactor) as T;

  T bold() => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ) as T;

  T center() => copyWith(
        textAlign: TextAlign.center,
      ) as T;

  T medium() => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.w600,
        ),
      ) as T;

  T italic() => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      ) as T;

  T normal() => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontStyle: FontStyle.normal,
        ),
      ) as T;

  T fontWeight(FontWeight fontWeight) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      ) as T;

  T fontSize(double size) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: size,
        ),
      ) as T;

  T textColor(Color color) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          color: color,
        ),
      ) as T;

  T textAlignment(TextAlign align) => copyWith(textAlign: align) as T;

  T withUnderLine() => copyWith(
        style: (style ?? const TextStyle())
            .copyWith(decoration: TextDecoration.underline),
      ) as T;

  T link() => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          color: Colors.blue[900],
        ),
      ) as T;
}
