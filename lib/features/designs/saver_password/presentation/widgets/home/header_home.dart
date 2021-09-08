import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_ext.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/mini_widgets.dart';
import 'mini_widgets/background_shapes.dart';
import 'mini_widgets/filter_icon.dart';
import 'mini_widgets/notification_icon.dart';
import 'mini_widgets/profile_image.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: ColorsApp.saverPrimary,
            child: Stack(
              children: [
                BackgroundShapes(),
                _HeaderHomeContent(),
              ],
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}

class _HeaderHomeContent extends StatelessWidget {
  const _HeaderHomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _AppBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 18.0,
                top: 10,
                bottom: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      'Welcome home',
                      color: Colors.grey.shade300,
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                    Space(0.01),
                    // TODO: Research for this letter
                    TextCustom(
                      'Rolando Garcia',
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    Space(0.03),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: context.width * .75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey.shade700,
                                ),
                                Space(0.025, isHorizontal: true),
                                Container(
                                  height: 50,
                                  width: context.width * .5,
                                  child: Center(
                                    child: TextFormField(
                                      cursorColor: ColorsApp.saverPrimary,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Search'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Space(0.05, isHorizontal: true),
                        FilterIcon(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Row(
          children: [
            Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_rounded,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Spacer(),
            NotificationIcon(),
            ProfileImage()
          ],
        ),
      ),
    );
  }
}
