// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'dart:math';

class FPHPageIndicator extends StatefulWidget {
  final currentPage;
  final maxPage;

  const FPHPageIndicator({Key key, this.currentPage, this.maxPage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FPHPageIndicatorState();
  }
}

class FPHPageIndicatorState extends State<FPHPageIndicator> {
  List<Color> _selectedColors = [
    Color(0xff4285F4),
    Color(0xffDB4437),
    Color(0xffF4B400),
    Color(0xff4285F4),
    Color(0xffDB4437),
    Color(0xffF4B400),
  ];
  Random _randomizer = Random();
  double _circleSize = 10;

  @override
  void initState() {
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
      width: 20,
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
    return _selectedColors[_randomizer.nextInt(_selectedColors.length - 1)];
  }
}
