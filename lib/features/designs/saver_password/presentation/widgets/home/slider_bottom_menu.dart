import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/mini_widgets.dart';
import '../../getX/saver_controller.dart';
import 'mini_widgets/account_item.dart';
import 'mini_widgets/slide_icon.dart';

class SliderBottomMenu extends StatelessWidget {
  const SliderBottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return GetBuilder<SaverController>(
      builder: (c) {
        final controller = c.controller;

        return AnimatedBuilder(
          animation: controller,
          child: _BodySlider(),
          builder: (_, child) {
            final value = controller.value;
            final goingUpLerp =
                lerpDouble(context.height * .4, context.height - top, value);
            return Positioned(
              bottom: 0,
              child: Container(
                width: context.width,
                height: goingUpLerp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}

class _BodySlider extends StatelessWidget {
  const _BodySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Space(0.02),
          _Slide(),
          Space(0.01),
          _Items(),
        ],
      ),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _TitleSlider('Latest Accounts'),
          Space(0.01),
          AccountItem(image: 'spotify'),
          AccountItem(image: 'netflix'),
          _TitleSlider('12 Jan 2021'),
          AccountItem(image: 'gmail'),
          AccountItem(image: 'tiktok'),
          _TitleSlider('11 Jun 2020'),
          AccountItem(image: 'rename'),
        ],
      ),
    );
  }
}

class _TitleSlider extends StatelessWidget {
  const _TitleSlider(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: .0),
      child: TextCustom(title, fontWeight: FontWeight.bold),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaverController>(
      builder: (c) {
        return GestureDetector(
          onVerticalDragStart: c.onVerticalDragStart,
          onVerticalDragUpdate: c.onVerticalDragUpdate,
          onVerticalDragEnd: c.onVerticalDragEnd,
          child: SlideIcon(),
        );
      },
    );
  }
}
