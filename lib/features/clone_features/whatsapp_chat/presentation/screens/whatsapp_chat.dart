import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../../core/utils/durations.dart';
import '../../../../../../core/utils/ui.dart';
import '../../../../../../core/widgets/dialogs/info_dialog.dart';
import '../../../../../../core/widgets/mini_widgets.dart';
import '../getX/bottom_inp_butn_controller.dart';
import '../widgets/chat/animated_btn.dart';
import '../widgets/chat/animated_input.dart';
import '../widgets/chat/animated_locked.dart';
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
    Future.delayed(Duration.zero, () async {
      final description =
          'My goals when I was developing this feature of whatsapp chat was to understand how the animations works between each other. Also understand how to make my own animations. \n \n'
          'Note: To work the app properly please accept all the permissions asked. This to avoid errors in the gallery part.';
      await Get.dialog(InfoDialog(
        description: description,
        title: 'Goals',
      ));
      await PhotoManager.requestPermissionExtend();
    });
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
        return Scaffold(
            appBar: AppBar(
              backgroundColor: UI.acentColor,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/83/90/4f/83904fe2be38c15fa471fffad7423667.jpg'),
                  ),
                  Space(
                    0.05,
                    isHorizontal: true,
                  ),
                  TextCustom(
                    'Peter Parker',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ],
              ),
              leading: BackButton(),
              actions: [
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
            body: SafeArea(
                bottom: Platform.isAndroid,
                top: Platform.isAndroid,
                child: Column(
                  children: [
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
                )));
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
