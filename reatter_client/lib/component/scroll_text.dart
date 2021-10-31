import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double top;
  final double speed;

  ScrollingText({
    @required this.text,
    this.textStyle,
    this.top: 0.5,
    this.speed: 1.0,
  }) : assert(text != null);

  @override
  State<StatefulWidget> createState() {
    return ScrollingTextState();
  }
}

class ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  double position = 0.0;
  Timer timer;
  double _moveDistance;
  final int _timerRest = 100;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _moveDistance = widget.speed * 10;
    if (_moveDistance < 1) {
      _moveDistance = 2.5;
    }
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
        double maxScrollExtent = scrollController.position.maxScrollExtent;
        double pixels = scrollController.position.pixels;
        if (pixels + _moveDistance >= maxScrollExtent) {
          scrollController.jumpTo(position);
        }
        position -= _moveDistance;
        scrollController.animateTo(position,
            duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget getBothEndsChild() {
    return Text(
      widget.text,
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: ListView(
        key: _key,
        reverse: true,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          getBothEndsChild(),
        ],
      ),
    );
  }
}
