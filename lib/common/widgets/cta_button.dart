// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHCtaButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color backgroundColor;

  const FPHCtaButton({Key key, this.onPressed, this.title, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 175,
        height: 48,
        child: Center(
          child: InkWell(
            onTap: onPressed,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
