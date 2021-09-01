import 'package:flutter/material.dart';

import '../../core/utils/durations.dart';

// Help to do animations more complex
// https://stackoverflow.com/q/58937111/10942018
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jump Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jump Animation Bar'),
        ),
        body: Center(
          child: SmoothAnimation(
            child: Container(
              height: 120,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SmoothAnimation extends StatefulWidget {
  const SmoothAnimation({
    Key? key,
    this.child,
    this.repeat = true,
    this.milliseconds = 2000,
    this.distance = .05,
  }) : super(key: key);

  final bool repeat;

  /// Duration of the animation
  final int milliseconds;

  /// The distance in x and y.
  /// The same number is used in the Offset, the unique difference is that
  /// one is positive and the other one is negative.
  /// If the number is too long the distance in too large otherwise the distance
  /// is short
  final double distance;

  final Widget? child;

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<SmoothAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    final distance = widget.distance;

    controller = AnimationController(
      vsync: this,
      duration: Durations.getDurationInMilliseconds(widget.milliseconds),
    );

    animation = Tween<Offset>(
      begin: Offset(0, -distance),
      end: Offset(0, distance),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));

    //easeInBack
    //easeInOutBack

    if (widget.repeat) {
      controller.forward();
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: animation, child: widget.child);
  }
}

/* 
 
*/
