import 'package:flutter/material.dart';

import '../../../../core/widgets/mini_widgets.dart';

class TextGradient extends StatelessWidget {
  const TextGradient(
    this.text, {
    Key? key,
    required this.gradient,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final Gradient gradient;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign; 

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: TextCustom(
        text,
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textAlign: textAlign,
      ),
    );
  }
}
