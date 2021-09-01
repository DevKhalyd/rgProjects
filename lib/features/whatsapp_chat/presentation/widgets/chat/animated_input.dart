import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/widgets/animations/mic_trash_animation.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/widgets/animations/trash_animation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../../getX/bottom_inp_butn_controller.dart';
import 'counter_input.dart';
import 'icon_animated.dart';

class AnimatedInput extends StatelessWidget {
  const AnimatedInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        final width = context.width;
        final shouldExpandInputSize = c.shouldExpandInputSize;
        return Positioned(
            bottom:
                (c.isOpenEmojiMenu ? 7 : 10) + c.getExtraSpaceForEmojiMenu(),
            left: 5,
            child: AnimatedBuilder(
                animation: c.controller,
                child: _RecordVoice(),
                builder: (_, child) {
                  final value = c.controller.value.clamp(0, 1).toDouble();
                  return Container(
                    // With .9 peercent get the size required and 81 is the size by default
                    // Use .68 and 9 to get the complete value
                    width: shouldExpandInputSize && !c.animatingUp
                        ? lerpDouble(width * .9,
                            c.animatingLeft ? width * .68 : width * .9, value)
                        : width * .81,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: Colors.white),
                    child: shouldExpandInputSize ? child : _BaseStateInput(),
                  );
                }));
      },
    );
  }
}

/// Widget to record the void
class _RecordVoice extends StatelessWidget {
  const _RecordVoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconAnimated(),
        Space(0.025, isHorizontal: true),
        CounterInput(),
        Spacer(),
        _ShimeText(),
      ],
    );
  }
}

class _ShimeText extends StatelessWidget {
  const _ShimeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.white,
        direction: ShimmerDirection.rtl,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 14,
            ),
            TextCustom(
              'Slide to cancel',
              fontSize: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

/// The widgets when the user is typing
class _BaseStateInput extends StatelessWidget {
  const _BaseStateInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _EmojiBtn(),
        _Input(),
        _ActionsInputBottom(),
      ],
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return Container(
          width: context.width * 0.45,
          child: TextFormField(
            controller: c.inputController,
            focusNode: c.inputFocus,
            maxLines: null,
            cursorColor: ColorsApp.whatsapp,
            decoration: InputDecoration.collapsed(
              hintText: 'Type a message...',
            ),
          ),
        );
      },
    );
  }
}

class _ActionsInputBottom extends StatelessWidget {
  const _ActionsInputBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: c.onTapFilesAttached,
                      child: Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: c.onTapCamera,
                      child: Icon(
                        Icons.camera,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}

class _EmojiBtn extends StatelessWidget {
  const _EmojiBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return Expanded(
          child: AnimatedSwitcher(
            duration: Durations.getDurationInMilliseconds(800),
            child: c.getLeftInputWidget(),
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween(
                begin: Offset(0, 2.5),
                end: Offset(0, 0),
              ).animate(animation),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
