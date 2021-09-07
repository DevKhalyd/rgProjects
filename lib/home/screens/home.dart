import 'package:flutter/material.dart';
import '../../../../core/utils/ui.dart';
import '../../../../core/widgets/mini_widgets.dart';
import '../widgets/section_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UI.primaryColor,
        centerTitle: true,
        title: TextCustom(
          'Rolando Garcia Portfolio',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      body: Column(
        children: UI.sectionList
            .map((e) => SectionButton(
                  section: e.section,
                  about: e.about,
                  route: e.route,
                ))
            .toList(),
      ),
    );
  }
}

class _AppHomeBar extends StatelessWidget {
  const _AppHomeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: UI.primaryColor,
        height: kToolbarHeight,
        child: Center(
            child: TextCustom(
          'Rolando Garcia Portfolio',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        )));
  }
}
