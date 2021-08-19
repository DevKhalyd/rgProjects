import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getX/bottom_input_controller.dart';
import 'chat_bubble.dart';

class ListMessages extends StatelessWidget {
  const ListMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(
      builder: (c) {
        final isKeyboardOpen = c.isKeyboardOpen;
        final height =
            (context.height * .77) - (isKeyboardOpen ? c.bottomSpaceExtra : 0);
        final messages = c.messages.reversed.toList();
        return Container(
          height: height,
          child: ListView.builder(
            itemCount: messages.length,
            padding: EdgeInsets.all(14.0),
            reverse: true,
            itemBuilder: (_, index) => ChatBubble(message: messages[index]),
          ),
        );
      },
    );
  }
}
