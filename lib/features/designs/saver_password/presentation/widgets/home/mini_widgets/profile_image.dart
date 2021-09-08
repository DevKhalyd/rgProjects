import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://thewaywomenwork.com/wp-content/uploads/2013/10/Polina-Guchsha-Russia-small-951x10246.jpg'))),
        ),
      ),
    );
  }
}
