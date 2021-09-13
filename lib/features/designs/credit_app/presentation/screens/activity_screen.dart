import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/widgets/mini_widgets.dart';
import '../widgets/activity/congrulations_card.dart';
import '../widgets/activity/list_recipients.dart';
import '../widgets/activity/number_animation.dart';
import '../widgets/activity/profile_animated.dart';

/// Part of Credit App
class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionCustom(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SafeArea(
            child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ),
            child: Column(
              children: [
                Space(0.02),
                TextCustom(
                  'Your balance',
                  color: Colors.grey,
                ),
                Space(0.005),
                _Amount(),
                Space(0.005),
                TextCustom(
                  'of total: \$1000',
                  color: Colors.grey,
                ),
                Space(0.04),
                _LeftText('YOUR RECIPIENTS'),
                Space(0.03),
                _Recipients(),
                Space(0.025),
                CongrulationCard(),
                Space(0.02),
                _Dots(),
                Space(0.025),
                _LeftText('TODAY'),
                Space(0.015),
                Expanded(
                  child: ListRecipients(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Dot(isEnabled: true),
        Space(0.02, isHorizontal: true),
        _Dot(),
        Space(0.02, isHorizontal: true),
        _Dot(),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    this.isEnabled = false,
  }) : super(key: key);

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: isEnabled ? Colors.black : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _LeftText extends StatelessWidget {
  const _LeftText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextCustom(text, color: Colors.grey),
    );
  }
}

class _Recipients extends StatelessWidget {
  const _Recipients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileAnimated(
          borderColor: Colors.pink,
          asset: path + 'h1.png',
          name: 'Francis D.',
        ),
        ProfileAnimated(
          borderColor: Colors.purple,
          asset: path + 'h2.png',
          name: 'Joshua D.',
        ),
        ProfileAnimated(
          borderColor: Colors.green,
          asset: path + 'h3.png',
          name: 'Angelica D.',
        ),
      ],
    );
  }
}

class _Amount extends StatelessWidget {
  const _Amount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, -12),
          child: TextCustom(
            '\$',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        NumberAnimation(
          avoid: 2,
          miliseconds: 9500,
        ),
        NumberAnimation(),
        NumberAnimation(miliseconds: 1500),
        Space(0.005, isHorizontal: true),
        Transform.translate(
          offset: Offset(0, 15),
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Space(0.005, isHorizontal: true),
        NumberAnimation(),
        NumberAnimation(),
      ],
    );
  }
}
