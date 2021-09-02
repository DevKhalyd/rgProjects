import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/widgets/chat/animated_locked.dart';

import '../../../../core/utils/ui.dart';
import '../../../../core/widgets/mini_widgets.dart';
import '../getX/bottom_inp_butn_controller.dart';
import '../widgets/chat/animated_btn.dart';
import '../widgets/chat/animated_input.dart';
import '../widgets/chat/emojis_menu.dart';
import '../widgets/chat/list_messages.dart';
import '../widgets/chat/menu_actions.dart';

class WhatsAppChat extends StatefulWidget {
  const WhatsAppChat({Key? key}) : super(key: key);

  @override
  _WhatsAppChatState createState() => _WhatsAppChatState();
}

class _WhatsAppChatState extends State<WhatsAppChat>
    with SingleTickerProviderStateMixin {
  /// A controller use by the children of this widget
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Durations.getDurationInMilliseconds(50));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        // Assign values
        c.context = context;
        c.controller = controller;
        return AnnotatedRegionCustom(
          child: Scaffold(
              body: SafeArea(
                  bottom: Platform.isAndroid,
                  top: Platform.isAndroid,
                  child: Column(
                    children: [
                      if (Platform.isIOS) ExtraSpaceForIOS(),
                      _AppBar(),
                      Expanded(
                          child: Stack(
                        children: [
                          Image.asset(
                            'assets/w/images/chat_bg.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          ListMessages(),
                          AnimatedInput(),
                          LockVoiceRecord(),
                          AnimatedButtonWhats(),
                          EmojisMenu(),
                          MenuSelectAction(),
                        ],
                      )),
                    ],
                  ))),
        );
      },
    );
  }
}

class ExtraSpaceForIOS extends StatelessWidget {
  const ExtraSpaceForIOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .05,
      width: double.infinity,
      color: UI.acentColor,
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
