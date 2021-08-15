import 'package:flutter/material.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/utils/durations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom animation'),
        ),
        body: _CustomWidget(),
      ),
    );
  }
}

class _CustomWidget extends StatefulWidget {
  const _CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  __CustomWidgetState createState() => __CustomWidgetState();
}

class __CustomWidgetState extends State<_CustomWidget> {
  // Nice to start
  final initialHeight = 65.0;
  final initialWidth = 120.0;

  late final finalHeight = 300.0;
  late final double finalWidth;

  final initialRightPosition = 20.0;
  final finalRightPosition = 0.0;

  late double currentHeight;
  late double currentWidth;
  late double currentRightPosition;
  double currentRadius = 100;

  @override
  void initState() {
    super.initState();
    // Init the values
    currentHeight = initialHeight;
    currentWidth = initialWidth;
    currentRightPosition = initialRightPosition;
  }

  @override
  void didChangeDependencies() {
    finalWidth = context.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
            duration: Durations.getDurationInMilliseconds(50),
            bottom: 0,
            // from 20 to 0
            right: currentRightPosition,
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                height: currentHeight,
                width: currentWidth,
                duration: Durations.getDurationInMilliseconds(200),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(currentRadius),
                      topLeft: Radius.circular(currentRadius),
                    )),
              ),
            ))
      ],
    );
  }

  void onTap() {
    setState(() {
      if (currentHeight == initialHeight) {
        currentHeight = finalHeight;
        currentWidth = finalWidth;
        currentRightPosition = finalRightPosition;
        currentRadius = 0;
      } else {
        currentHeight = initialHeight;
        currentWidth = initialWidth;
        currentRightPosition = initialRightPosition;
        currentRadius = 100;
      }
    });
  }
}
