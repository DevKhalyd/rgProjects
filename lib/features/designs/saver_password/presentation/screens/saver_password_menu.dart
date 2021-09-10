import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../widgets/home/mini_widgets/profile_image.dart';

class SavePasswordMenu extends StatelessWidget {
  const SavePasswordMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .925,
      width: context.width * .75,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        children: [
          _HeaderMenu(),
          _RefactorWidget(),
          _RefactorWidget(),
          _RefactorWidget(),
          _RefactorWidget(),
          _RefactorWidget(),
        ],
      ),
    );
  }
}

class _RefactorWidget extends StatelessWidget {
  const _RefactorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(51, 65, 72, 1.0),
            borderRadius: BorderRadius.circular(32.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Space(0.09, isHorizontal: true),
              Icon(
                Icons.cloud_upload_outlined,
                color: Colors.white,
              ),
              Space(0.06, isHorizontal: true),
              TextCustom(
                'Example text',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderMenu extends StatelessWidget {
  const _HeaderMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Container(
        height: 70,
        width: context.width * .65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey, width: .5),
        ),
        child: Row(
          children: [
            Space(0.01, isHorizontal: true),
            ProfileImage(
              radius: 25,
            ),
            Space(0.01, isHorizontal: true),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Change the name or the pic url to match with the current flow
                TextCustom(
                  'Rolando Garcia',
                  fontWeight: FontWeight.bold,
                ),
                Space(0.0025),
                TextCustom('email@custom.com'),
              ],
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_down),
            Space(0.025, isHorizontal: true),
          ],
        ),
      ),
    );
  }
}
