import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/getX/bottom_inp_butn_controller.dart';

import '../../getX/bottom_input_controller.dart';
import 'chat_bubble.dart';

class ListMessages extends StatelessWidget {
  const ListMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        final messages = c.messages.reversed.toList();

        return Padding(
          padding: const EdgeInsets.only(
            bottom: 60,
          ),
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
