import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/ui.dart';
import '../../../../core/widgets/mini_widgets.dart';
import '../widgets/bottom_input.dart';

class WhatsAppChat extends StatelessWidget {
  const WhatsAppChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
              BottomInput(),
              if (false)
                Positioned(
                  bottom: 1,
                  child: Container(
                    width: context.width,
                    height: context.height * 0.25,
                    color: Colors.red,
                  ),
                )
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
