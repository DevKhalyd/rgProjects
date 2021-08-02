import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rg_projects/core/utils/colors.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../getX/bottom_input_controller.dart';

class BottomInput extends StatelessWidget {
  const BottomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(
        init: BottomInputController(),
        builder: (_) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: kToolbarHeight,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 5,
                      bottom: bottomSpace,
                      child: Container(
                        width: context.width * 0.84,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.grey,
                                )),
                            Container(
                              width: context.width * 0.45,
                              height: 50,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                  cursorColor: ColorsApp.whatsapp,
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Type a message...'),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: bottomSpace,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        decoration: BoxDecoration(
                          color: ColorsApp.whatsapp,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
