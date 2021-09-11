import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide ContextExtensionss;

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../getX/saver_menu_controller.dart';
import '../widgets/home/mini_widgets/profile_image.dart';

const _color = Color.fromRGBO(51, 65, 72, 1.0);

const _space = 10.0;

class SavePasswordMenu extends StatelessWidget {
  const SavePasswordMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaverMenuController>(builder: (c) {
      final controller = c.controller;

      return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          // Min:  context.width * .75 * -1 , Max: 10
          final left = lerpDouble((context.width * .75) * -1, 10, c.value);
          return Positioned(
            left: left,
            top: context.paddingTop,
            bottom: _space,
            child: Container(
              height: context.height * .925,
              width: context.width * .75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: _MenuBody(),
            ),
          );
        },
      );
    });
  }
}

class _MenuBody extends StatelessWidget {
  const _MenuBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeaderMenu(),
        _ItemMenu(
          icon: FontAwesomeIcons.home,
          name: 'Home',
        ),
        _ItemMenu(
          icon: FontAwesomeIcons.donate,
          name: 'Donate',
        ),
        _ItemMenu(
          icon: FontAwesomeIcons.sync,
          name: 'Synchronization',
          isEnabled: true,
        ),
        _ItemMenu(
          icon: FontAwesomeIcons.moon,
          name: 'Nigh mode',
        ),
        _ItemMenu(
          icon: FontAwesomeIcons.cogs,
          name: 'Settings',
        ),
        Spacer(),
        _ItemMenu(
          icon: FontAwesomeIcons.signOutAlt,
          name: 'Sign out',
        ),
      ],
    );
  }
}

class _ItemMenu extends StatelessWidget {
  const _ItemMenu({
    Key? key,
    required this.name,
    required this.icon,
    this.isEnabled = false,
  }) : super(key: key);

  final bool isEnabled;
  final String name;

  /// Use FontAwesomeIcons
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: isEnabled ? _color : null,
            borderRadius: BorderRadius.circular(32.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Space(0.09, isHorizontal: true),
              FaIcon(
                icon,
                color: isEnabled ? Colors.white : _color,
                size: 20,
              ),
              Space(0.06, isHorizontal: true),
              TextCustom(
                name,
                color: isEnabled ? Colors.white : _color,
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
                TextCustom(
                  'Roose Poole',
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
