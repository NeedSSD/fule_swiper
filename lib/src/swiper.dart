import 'dart:async';

import 'package:flutter/material.dart';
import 'dot_sequence.dart';

class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> children;
  final int current;
  final bool autoplay;
  final int duration;
  final int interval;
  final Curve curve;
  final bool indicatorDot;
  final Color indicatorColor;
  final Color indicatorActiveColor;
  final double indicatorRadius;
  final double indicatorSpacing;
  final Alignment indicatorAlignment;
  final ValueChanged<int> onPageChanged;

  Swiper({
    Key key,
    this.width = 100.0,
    this.height = 100.0,
    @required this.children,
    this.current = 0,
    this.autoplay = false,
    this.duration = 500,
    this.interval = 4000,
    this.curve = Curves.ease,
    this.indicatorDot = true,
    this.indicatorColor = Colors.white,
    this.indicatorActiveColor = Colors.blue,
    this.indicatorRadius = 4.0,
    this.indicatorSpacing = 8.0,
    this.indicatorAlignment = Alignment.bottomCenter,
    this.onPageChanged,
  })  : assert(children != null),
        assert(duration <= interval),
        assert(current >= 0 && current < children.length),
        super(key: key);

  @override
  _SwiperState createState() => _SwiperState(this.current, this.children);
}

class _SwiperState extends State<Swiper> {
  int itemCount;
  int _index;
  SliverChildDelegate _sliverChildDelegate;
  PageController _pageController;
  List<Timer> _timerList = List();

  _SwiperState(current, children) {
    //创建delegate
    this._sliverChildDelegate = SliverChildListDelegate(children);
    //设置显示的页面序号
    this._index = current;
    //创建controller
    this._pageController = PageController(initialPage: this._index);
  }

  @override
  Widget build(BuildContext context) {
    //创建定时器
    if (widget.autoplay) {
      if (this._timerList.length != 0) {
        // print('TimerList数量${this._timerList.length}');
        this._timerList.forEach((timer) {
          if (timer.isActive) {
            timer.cancel();
          }
        });
        this._timerList.clear();
      }

      this
          ._timerList
          .add(Timer.periodic(Duration(milliseconds: widget.interval), (timer) {
            if (this._index == widget.children.length - 1) {
              this._pageController.animateToPage(
                    0,
                    duration: Duration(milliseconds: widget.duration),
                    curve: widget.curve,
                  );
            } else {
              this._pageController.nextPage(
                    duration: Duration(milliseconds: widget.duration),
                    curve: widget.curve,
                  );
            }
            this._timerList.last.cancel();
          }));
    }

    //是否显示指示器
    Widget getIndicatorDot() {
      if (widget.indicatorDot) {
        return Align(
          alignment: widget.indicatorAlignment,
          child: DotSequence(
            radius: widget.indicatorRadius,
            spacing: widget.indicatorSpacing,
            color: widget.indicatorColor,
            activeColor: widget.indicatorActiveColor,
            current: this._index,
            itemCount: widget.children.length,
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return Container(
      color: Colors.transparent,
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: <Widget>[
          PageView.custom(
              childrenDelegate: this._sliverChildDelegate,
              controller: this._pageController,
              onPageChanged: (index) {
                setState(() {
                  this._index = index;
                  widget.onPageChanged?.call(index);
                });
              }),
          getIndicatorDot()
        ],
      ),
    );
  }
}
