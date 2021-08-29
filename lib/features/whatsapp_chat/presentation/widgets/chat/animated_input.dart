import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';
import '../../getX/bottom_inp_butn_controller.dart';

class AnimatedInput extends StatelessWidget {
  const AnimatedInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return Positioned(
          // Need 10 of space to show all the data
          bottom: (c.isOpenEmojiMenu ? 7 : 10) + c.getExtraSpaceForEmojiMenu(),
          left: 5,
          child: Container(
            // With .9 peercent get the size required
            width: context.width * .81,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0), color: Colors.white),
            child: Row(
              children: [
                _EmojiBtn(),
                Container(
                  width: context.width * 0.45,
                  child: TextFormField(
                    controller: c.inputController,
                    focusNode: c.inputFocus,
                    maxLines: null,
                    cursorColor: ColorsApp.whatsapp,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Type a message...'),
                  ),
                ),
                _ActionsInputBottom(),
              ],
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
            child: IconButton(
                onPressed: c.onTapEmojis,
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                )));
      },
    );
  }
}
