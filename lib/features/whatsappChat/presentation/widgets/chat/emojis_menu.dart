import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/colors.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';
import 'package:rg_projects/features/whatsappChat/presentation/getX/bottom_input_controller.dart';

class EmojisMenu extends StatelessWidget {
  const EmojisMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(
      builder: (c) {
        final isOpenEmojiMenu = c.isOpenEmojiMenu;
        return AnimatedPositioned(
          duration: Durations.defaultAnimation,
          bottom: 0,
          child: AnimatedContainer(
            duration: Durations.defaultAnimation,
            height: isOpenEmojiMenu ? c.getBottomSpace() - 10 : 0,
            width: context.width,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey.shade100,
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      EmojiTab(isEnabled: true),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                      EmojiTab(),
                    ],
                  ),
                )),
                Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Center(
                        child: TextCustom('Emojis not avaibles'),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmojiTab extends StatelessWidget {
  const EmojiTab({
    Key? key,
    this.isEnabled = false,
    this.icon = Icons.emoji_emotions_outlined,
  }) : super(key: key);

  final bool isEnabled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(
      builder: (c) {
        return Container(
          height: 90,
          width: 40,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Space(0.009),
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                ),
                Space(0.01),
                if (isEnabled)
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: ColorsApp.whatsapp,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
