import 'package:flutter/material.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';
import '../../../../../../core/extensions/build_context_ext.dart';
import 'mini_widgets/account_item.dart';
import 'mini_widgets/slide_icon.dart';

class SliderBottomMenu extends StatelessWidget {
  const SliderBottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NOTE: Maybe this one needs another stack
    return Positioned(
      bottom: 0,
      child: Container(
        width: context.width,
        // Min: 39.5
        height: context.height * .39,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space(0.02),
                _Slide(),
                Space(0.04),
                _TitleSlider('Lattest Accounts'),
                Space(0.01),
                AccountItem(image: 'spotify'),
                AccountItem(image: 'netflix'),
                _TitleSlider('12 Jan 2021'),
                AccountItem(image: 'gmail'),
                AccountItem(image: 'tiktok'),
                _TitleSlider('11 Jun 2020'),
                AccountItem(image: 'rename'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleSlider extends StatelessWidget {
  const _TitleSlider(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextCustom(title, fontWeight: FontWeight.bold),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SlideIcon());
  }
}
