import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rg_projects/core/utils/colors.dart';

import '../../../../../../../core/extensions/build_context_ext.dart';
import '../../../../../../../core/widgets/mini_widgets.dart';
import 'card_circle_image.dart';

final _path = 'assets/s_p/';

class AccountItem extends StatelessWidget {
  const AccountItem({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 120,
      width: context.width * 75,
      decoration: BoxDecoration(
        color: ColorsApp.accountItem,
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Column(
              children: [
                Space(0.025),
                CardCircleImage(
                  asset: _path + image + ".png",
                  side: 35,
                ),
              ],
            ),
            Space(0.025, isHorizontal: true),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space(0.0),
                TextCustom(
                  image[0].toUpperCase() + image.substring(1),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                TextCustom('test@$image.com'),
                Row(
                  children: [
                    TextCustom(
                      '********',
                      fontSize: 12.0,
                      letterSpacing: 4.0,
                    ),
                    Space(0.02, isHorizontal: true),
                    Transform.translate(
                      offset: Offset(0, -2),
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                Space(0.01),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.ellipsisH,
                      color: Colors.grey,
                      size: 14,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
