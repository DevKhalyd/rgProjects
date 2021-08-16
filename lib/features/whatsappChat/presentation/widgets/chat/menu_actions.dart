import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

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
          // The container that contains the menu
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            duration: Durations.getDurationInMilliseconds(200),
            height: c.currentHeight,
            width: c.currentWidth,
            child: AnimatedContainer(
                duration: Durations.getDurationInMilliseconds(450),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(c.currentRadius))),
                child: AnimatedSwitcher(
                  switchOutCurve: Curves.fastLinearToSlowEaseIn,
                  duration: Durations.getDurationInMilliseconds(70),
                  child: c.showContent
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 4.0),
                          child: Container(
                            child: Column(
                              children: [
                                Space(0.03),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MenuActionItem(
                                        icon: Icons.camera,
                                        color: Colors.blue,
                                        label: 'Document',
                                      ),
                                      MenuActionItem(
                                        icon: Icons.camera,
                                        color: Colors.red,
                                        label: 'Camera',
                                      ),
                                      MenuActionItem(
                                        icon: Icons.view_carousel,
                                        color: Colors.purple,
                                        label: 'Gallery',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MenuActionItem(
                                        icon: Icons.audiotrack,
                                        color: Colors.orange,
                                        label: 'Audio',
                                      ),
                                      MenuActionItem(
                                        icon: Icons.camera,
                                        color: Colors.green,
                                        label: 'Location',
                                      ),
                                      MenuActionItem(
                                        icon: Icons.camera,
                                        color: Colors.blueAccent,
                                        label: 'Contact',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      : Container(),
                )),
          ),
        );
      },
    );
  }
}
