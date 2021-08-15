import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/durations.dart';
import '../../getX/attachment_files_controller.dart';
import 'menu_action_item.dart';

class MenuSelectAction extends StatelessWidget {
  const MenuSelectAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttachmentFilesController>(
      init: AttachmentFilesController(),
      builder: (c) {
        return AnimatedPositioned(
          bottom: c.getBottomSpace(),
          right: c.getRightDistance(),
          duration: Durations.getDurationInMilliseconds(150),
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: Durations.getDurationInMilliseconds(200),
            height: c.currentHeight,
            width: c.currentWidth,
            child: AnimatedContainer(
              duration: Durations.getDurationInMilliseconds(450),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(c.currentRadius))),
              child: c.isOpenMenu
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      child: Wrap(
                        spacing: 60.0,
                        alignment: WrapAlignment.center,
                        runSpacing: 30.0,
                        children: [
                          MenuActionItem(),
                          MenuActionItem(),
                          MenuActionItem(),
                          MenuActionItem(),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ),
        );
      },
    );
  }
}
