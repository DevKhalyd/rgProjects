import 'package:flutter/material.dart';

import '../widgets/home/header_home.dart';

class SaverPasswordHome extends StatelessWidget {
  const SaverPasswordHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderHome(),
        BodyHome(),
      ],
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
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
              color: Colors.green,
            ))
      ],
    );
  }
}
