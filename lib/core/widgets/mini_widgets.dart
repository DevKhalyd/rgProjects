import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rg_projects/core/utils/themes.dart';
import '../extensions/build_context_ext.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
    this.data, {
    Key? key,
    this.fontSize = 14,
    this.fontWeight,
    this.color = Colors.black,
    this.letterSpacing,
    this.decoration,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String data;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color color;

  // final String fontFamily;

  final TextDecoration? decoration;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }
}

class CenterText extends StatelessWidget {
  const CenterText(this.data, {Key? key, this.fontSize}) : super(key: key);

  final String data;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextCustom(
      data,
      fontSize: fontSize,
    ));
  }
}

/// Show a `white space` inside of a Column or a Row
class SizedBoxCustom extends StatelessWidget {
  const SizedBoxCustom(this.space, {Key? key, this.isHorizontal = false})
      : super(key: key);

  final double space;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) return SizedBox(width: space);
    return SizedBox(height: space);
  }
}

/// Show a `white space` inside of a Column or a Row depending on the
/// screen size avaible. Consider that the [space] param must not be greater
/// than 0.99 because if the device is too big the design gets unshape
class Space extends StatelessWidget {
  const Space(this.space, {this.isHorizontal = false})
      : assert(space < 0.1,
            'The space cannot be greater than 0.1, because if the screen is too big the design can give us several problems');
  final double space;

  /// If [isHorizontal] is set to true the space is
  /// for a Row widget or similar widget
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) => isHorizontal
      ? SizedBox(
          width: _getSpace(context) * space,
        )
      : SizedBox(
          height: _getSpace(context) * space,
        );

  double _getSpace(BuildContext context) =>
      isHorizontal ? context.width : context.height;
}

class AnnotatedRegionCustom extends StatelessWidget {
  const AnnotatedRegionCustom({
    Key? key,
    required this.child,
    this.value = MyThemes.lightTheme,
  }) : super(key: key);

  final Widget child;

  /// Use the `MyThemes` class to handle the theme.
  ///
  /// For example the dark theme
  final SystemUiOverlayStyle value;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: value,
      child: child,
    );
  }
}

class CircularProgressCustom extends StatelessWidget {
  const CircularProgressCustom({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 2.5,
        ),
      );
}
