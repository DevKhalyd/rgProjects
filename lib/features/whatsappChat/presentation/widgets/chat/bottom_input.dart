import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../core/utils/colors.dart';
import '../../getX/bottom_input_controller.dart';

class BottomInput extends StatelessWidget {
  const BottomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(builder: (c) {
      return AnimatedPositioned(
        duration: defaultAnimation,
        left: 5,
        bottom: c.getBottomSpace(),
        child: Container(
          width: context.width * 0.84,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: c.openCloseEmojiMenu,
                  icon: Icon(
                    c.isOpenEmojiMenu
                        ? Icons.keyboard
                        : Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  )),
              Container(
                width: context.width * 0.45,
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    focusNode: c.focusNode,
                    cursorColor: ColorsApp.whatsapp,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Type a message...'),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                  onPressed: c.onPressedCamera,
                  icon: Icon(
                    Icons.camera,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      );
    });
  }
}
