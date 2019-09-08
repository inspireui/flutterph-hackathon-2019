// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/responsive_widget.dart';
import 'package:flutterph_hackathon2019/common/widgets/widgets.dart';
import 'dart:math';

import 'package:flutterph_hackathon2019/theme/theme.dart';

class FPHPageIndicator extends StatefulWidget {
  final BuildContext rootContext;
  final currentPage;
  final maxPage;

  const FPHPageIndicator(
      {Key key, this.rootContext, this.currentPage, this.maxPage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FPHPageIndicatorState();
  }
}

class FPHPageIndicatorState extends State<FPHPageIndicator> {
  List<Color> _selectedColors = [
    FPHColors.blue,
    FPHColors.yellow,
    FPHColors.red,
  ];
  Random _randomizer = Random();
  double _circleSize = 10;

  @override
  void initState() {
    _circleSize = ResponsiveWidget.isLargeScreen(widget.rootContext) ? 10 : 5;

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(widget.rootContext) ? 20 : 10,
      alignment: Alignment.center,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.maxPage,
          itemBuilder: (BuildContext context, int index) {
            return _buildCircleIndicatorList(index);
          },
        ),
      ),
    );
  }

  Widget _buildCircleIndicatorList(int index) {
    if (widget.currentPage == index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: _circleSize,
          height: _circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getSelectedColor(),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: _circleSize,
          height: _circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black26,
          ),
        ),
      );
    }
  }

  Color _getSelectedColor() {
    return _selectedColors[_randomizer.nextInt(_selectedColors.length)];
  }
}
