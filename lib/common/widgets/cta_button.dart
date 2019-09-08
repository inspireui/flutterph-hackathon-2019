// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHCtaButton extends StatelessWidget {
  final double width;
  final Function onPressed;
  final String title;
  final Color titleColor;
  final Color backgroundColor;

  const FPHCtaButton({Key key, this.width, this.onPressed, this.title, this.titleColor, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: width * 0.08,
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width * 0.110,
          height: width * 0.030,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: titleColor,
                // TODO: Declare Dynamic Font Size
                fontSize: width * 0.0125,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
