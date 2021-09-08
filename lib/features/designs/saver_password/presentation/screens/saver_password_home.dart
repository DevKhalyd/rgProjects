import 'package:flutter/material.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/widgets/home/mini_widgets/add_icon.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/widgets/home/mini_widgets/category_item.dart';

import '../../../../../core/widgets/mini_widgets.dart';
import '../widgets/home/header_home.dart';
import '../widgets/home/mini_widgets/slide_icon.dart';

class SaverPasswordHome extends StatelessWidget {
  const SaverPasswordHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderHome(),
        _BodyHome(),
      ],
    );
  }
}

const _border = 24.0;

class _BodyHome extends StatelessWidget {
  const _BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_border),
                    topRight: Radius.circular(_border),
                  )),
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Space(0.02),
                        SlideIcon(),
                        Space(0.025),
                        _Title(),
                        Space(0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoryItem(label: 'Streaming'),
                            CategoryItem(label: 'Medsos'),
                            CategoryItem(label: 'Edtech'),
                            CategoryItem(label: 'Wallet'),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ))
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCustom(
          'My Category Account',
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        Spacer(),
        AddIcon()
      ],
    );
  }
}
