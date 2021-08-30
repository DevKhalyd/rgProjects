import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/streams.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../../getX/bottom_inp_butn_controller.dart';

class CounterInput extends StatefulWidget {
  const CounterInput({Key? key}) : super(key: key);

  @override
  _CounterInputState createState() => _CounterInputState();
}

class _CounterInputState extends State<CounterInput> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return StreamBuilder<HourMinute>(
            stream: c.streams.timedCounter(c.currentTime),
            builder: (_, snapshot) {
              final data = snapshot.data;
              if (data != null) c.currentTime = data;
              final second = data?.second ?? "00";
              return TextCustom(
                '${data?.minute ?? 0} : $second',
                fontSize: 17,
                color: Colors.grey.shade700,
              );
            });
      },
    );
  }
}
