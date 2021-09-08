import 'package:flutter/material.dart';

import 'shape_transparent.dart';

class BackgroundShapes extends StatelessWidget {
  const BackgroundShapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // The names of this widgets refer to the position of each one (Doesn't matter)
          _LTOne(),
          _LTwo(),
          _LMOne(),
          _LNB(),
          _MBR(),
          _RST(),
          Positioned(
            top: -15,
            right: 5,
            child: ShapeTransparent(
              width: 90,
              transparent: true,
              angle: 2.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _RST extends StatelessWidget {
  const _RST({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: -45,
      child: ShapeTransparent(
        width: 180,
        height: 100,
        angle: 2.65,
      ),
    );
  }
}

class _MBR extends StatelessWidget {
  const _MBR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      right: 90,
      child: ShapeTransparent(
        width: 150,
        height: 70,
        angle: 2.65,
      ),
    );
  }
}

class _LNB extends StatelessWidget {
  const _LNB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 140,
      left: 70,
      child: ShapeTransparent(
        width: 70,
      ),
    );
  }
}

class _LMOne extends StatelessWidget {
  const _LMOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: -40,
      child: ShapeTransparent(
        width: 250,
        transparent: true,
      ),
    );
  }
}

class _LTOne extends StatelessWidget {
  const _LTOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -55,
      child: ShapeTransparent(
        width: 70,
      ),
    );
  }
}

class _LTwo extends StatelessWidget {
  const _LTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -15,
      left: 35,
      child: ShapeTransparent(
        width: 150,
      ),
    );
  }
}
