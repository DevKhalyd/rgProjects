import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_ext.dart';
import '../../../../../../core/widgets/mini_widgets.dart';

final path = 'assets/c_a/';

class CongrulationCard extends StatelessWidget {
  const CongrulationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: context.height * .125,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 2.0,
          child: Row(
            children: [
              Space(0.03, isHorizontal: true),
              _ImageCongrats(),
              Space(0.03, isHorizontal: true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(0.02),
                  TextCustom(
                    'Congrulations!',
                    fontWeight: FontWeight.bold,
                  ),
                  Space(0.007),
                  TextCustom(
                    'One of your recipients just\n ordered his card!',
                    color: Colors.grey,
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageCongrats extends StatelessWidget {
  const _ImageCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(path + 'party.png'),
    );
  }
}
