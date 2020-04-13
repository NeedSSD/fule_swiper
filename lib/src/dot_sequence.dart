import 'package:flutter/material.dart';

class DotSequence extends StatelessWidget {
  final double radius;
  final double spacing;
  final Color color;
  final Color activeColor;
  final int current;
  final int itemCount;
  DotSequence({
    Key key,
    this.radius,
    this.spacing,
    this.color,
    this.activeColor,
    this.current = 0,
    this.itemCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //定义normal圆点
    Widget _normalDot = Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
    //定义active圆点
    Widget _activeDot = Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activeColor,
      ),
    );
    //定义间距
    Widget _spacing = SizedBox(
      height: radius * 2,
      width: spacing,
    );
    //生成圆点列表
    List<Widget> _dotList = List();
    for (var i = 0; i < itemCount; i++) {
      i == current ? _dotList.add(_activeDot) : _dotList.add(_normalDot);
      if (i != itemCount - 1) {
        _dotList.add(_spacing);
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _dotList,
    );
  }
}
