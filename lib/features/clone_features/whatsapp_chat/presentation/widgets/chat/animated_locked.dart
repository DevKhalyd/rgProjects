import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/colors.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import '../../getX/bottom_inp_butn_controller.dart';
import '../animations/smooth_animation.dart';

const _baseState = 45.0;
const _hideState = -130.0;
const _upState = 180.0;

const _heightContainer = 125.0;
const _minHeightContainer = 55.0;

class LockVoiceRecord extends StatelessWidget {
  const LockVoiceRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        if (!c.shouldExpandInputSize) return Container();

        final controller = c.controller;

        return AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            double value = controller.value * (c.animatingLeft ? 1.15 : 1);

            final shouldApearIcon =
                (!c.animatingUp) || (c.animatingUp && value < .6);

            // MAX: 45 MIN: -130
            final bottomForAnimatingLeft =
                lerpDouble(_baseState, _hideState, value);

            final bottomForAnimatingUp =
                lerpDouble(_baseState, _upState, c.animatingUp ? value : .0);

            final heightForAnimatingContainer = lerpDouble(
              _heightContainer,
              _minHeightContainer,
              c.animatingUp ? value : .0,
            );

            return Positioned(
              right: 10,
              bottom: c.animatingLeft
                  ? bottomForAnimatingLeft
                  : c.animatingUp
                      ? bottomForAnimatingUp
                      : _baseState,
              child: SmoothAnimation(
                distance: 0.025,
                milliseconds: 3000,
                child: Container(
                  // MAX: 125 - Min: 50
                  height: c.animatingUp
                      ? heightForAnimatingContainer
                      : _heightContainer,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(lerpDouble(20, 64, value)!),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Space(0.015),
                      SmoothAnimation(
                        milliseconds: 1500,
                        child: Icon(
                          Icons.lock,
                          color: Color.lerp(
                              Colors.grey.shade700, ColorsApp.whatsapp, value),
                        ),
                      ),
                      if (shouldApearIcon) Space(0.02),
                      if (shouldApearIcon)
                        SmoothAnimation(
                          milliseconds: 1500,
                          child: Icon(Icons.keyboard_arrow_up),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
