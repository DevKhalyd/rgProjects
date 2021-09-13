import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: _Body(),
      ),
    );
  }
}

const _size = 80.0;

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: _Clipper(),
        child: Container(
          height: _size,
          width: _size,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final halfWidth = width / 2;
    final halfHeight = height / 2;

    return Path()
      ..moveTo(width * .45, height * .05)
      // Curve top
      ..conicTo(halfWidth, 0, width * .75, height * .25, 2)
      // Right _side
      ..conicTo(size.width, halfHeight, width * .75, height * .75, 2)
      // Curve bottom
      ..conicTo(halfWidth, height, width * .25, height * .75, 2)
      // Left _side
      ..conicTo(0, halfHeight, height * .25, width * .25, 2)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
