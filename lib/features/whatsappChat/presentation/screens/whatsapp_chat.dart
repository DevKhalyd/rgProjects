import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/ui.dart';
import '../../../../core/widgets/mini_widgets.dart';
import '../getX/bottom_input_controller.dart';
import '../widgets/chat/bottom_input.dart';
import '../widgets/chat/emojis_menu.dart';
import '../widgets/chat/mic_button.dart';

class WhatsAppChat extends StatefulWidget {
  const WhatsAppChat({Key? key}) : super(key: key);

  @override
  _WhatsAppChatState createState() => _WhatsAppChatState();
}

class _WhatsAppChatState extends State<WhatsAppChat> {
  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    BottomInputController.to.assignBottomExtraSpace(bottomSpace);
    BottomInputController.to.assignContext(context);
    return AnnotatedRegionCustom(
      child: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          _AppBar(),
          Expanded(
              child: Stack(
            children: [
              Image.asset(
                'assets/w/images/chat_bg.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: context.height,
              ),
              // Same piece
              BottomInput(),
              MicButton(),
              // Same piece
              EmojisMenu(),
            ],
          )),
        ],
      ))),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: double.infinity,
      color: UI.acentColor,
      child: Row(
        children: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/83/90/4f/83904fe2be38c15fa471fffad7423667.jpg'),
          ),
          Space(
            0.02,
            isHorizontal: true,
          ),
          TextCustom(
            'Peter Parker',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.0,
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
