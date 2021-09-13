import 'package:flutter/material.dart';

import '../../../../../../core/utils/logical.dart';
import '../../../../../../core/widgets/mini_widgets.dart';
import 'img_recipients.dart';

const _path = 'assets/c_a/';

class RecipientItem extends StatelessWidget {
  const RecipientItem({
    Key? key,
    required this.image,
    required this.name,
    required this.store,
    required this.storeColor,
  }) : super(key: key);

  final String image, name, store;
  final Color storeColor;

  @override
  Widget build(BuildContext context) {
    final tens = Logical.generateInt();
    final decimals = Logical.generateInt();

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          ImgProfile(
            side: 70,
            asset: _path + image + '.png',
          ),
          Space(
            0.005,
            isHorizontal: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' on ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: store,
                        style: TextStyle(
                          color: storeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              Space(0.0025),
              TextCustom(
                '15:20',
                color: Colors.grey,
              )
            ],
          ),
          Spacer(),
          TextCustom(
            '\$$tens.$decimals',
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
