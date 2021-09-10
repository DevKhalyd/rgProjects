import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/widgets/mini_widgets.dart';
import '../../../getX/saver_controller.dart';

class AddAccountBtn extends StatelessWidget {
  const AddAccountBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaverController>(
      builder: (c) {
        final controller = c.controller;
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                return Opacity(
                  opacity: lerpDouble(1.0, 0.0, controller.value)!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(34.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Space(0.02, isHorizontal: true),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          Space(0.02, isHorizontal: true),
                          TextCustom(
                            'Add account',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          Space(0.03, isHorizontal: true),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
