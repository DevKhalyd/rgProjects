import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/ui.dart';

import '../../core/widgets/mini_widgets.dart';

/// A section named with it's children
class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
    required this.title,
    this.children = const [],
    this.withScroll = false,
  }) : super(key: key);

  final String title;
  final bool withScroll;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(children: children);

    if (withScroll) child = SingleChildScrollView(child: child);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: UI.primaryColor,
          centerTitle: true,
          title: TextCustom(
            title,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
          )),
      body: child,
    );
  }
}
