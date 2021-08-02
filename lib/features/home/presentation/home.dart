import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/routes.dart';
import 'package:rg_projects/core/utils/themes.dart';
import 'package:rg_projects/core/utils/ui.dart';

import '../../../core/widgets/mini_widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegionCustom(
        value: MyThemes.primaryTheme,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  color: UI.primaryColor,
                  height: kToolbarHeight,
                  child: Center(
                      child: TextCustom(
                    'Demos',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ))),
              Space(0.01),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.WHATSAPP_CHAT);
                },
                child: TextCustom('WhatsApp Chat'),
              ),
              Space(0.01),
            ],
          ),
        ),
      ),
    );
  }
}
