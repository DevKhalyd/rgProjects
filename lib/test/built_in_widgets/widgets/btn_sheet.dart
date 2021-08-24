import 'package:flutter/material.dart';

class BottomSheetTest extends StatelessWidget {
  const BottomSheetTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Hello Bottom'),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (c) {
                return Container(
                  height: 420,
                  width: double.infinity,
                  color: Colors.red,
                );
              });
        },
      ),
    );
  }
}
