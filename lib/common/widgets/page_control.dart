// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

enum FPHPageControlOption { NEXT, PREVIOUS }

class FPHPageControl extends StatelessWidget {
  final FPHPageControlOption controlOption;
  final Color color;
  final Function onPressed;

  const FPHPageControl(
      {Key key, this.controlOption, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controlOption == FPHPageControlOption.NEXT) {
      return InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Next Page',
                style: TextStyle(fontSize: 12, color: color),
              ),
              Icon(Icons.arrow_downward, color: color)
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Previous Page',
                style: TextStyle(fontSize: 12, color: color),
              ),
              Icon(Icons.arrow_upward, color: color)
            ],
          ),
        ),
      );
    }
  }
}
