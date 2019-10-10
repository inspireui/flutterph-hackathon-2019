// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';

class FPHCtaButton extends StatelessWidget {
  final BuildContext rootContext;
  final Function onPressed;
  final String title;
  final Color titleColor;
  final Color backgroundColor;

  const FPHCtaButton(
      {Key key,
      this.rootContext,
      this.onPressed,
      this.title,
      this.titleColor,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: ResponsiveWidget.isLargeScreen(context) ? 12 : 8,
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.all(
        Radius.circular(ResponsiveWidget.isLargeScreen(context) ? 16 : 12),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: ResponsiveWidget.isLargeScreen(context) ? 170 : 130,
          height: ResponsiveWidget.isLargeScreen(context) ? 48 : 36,
          child: Center(
            child: Text(
              title,
              textScaleFactor:
                  ResponsiveWidget.isLargeScreen(rootContext) ? 1.25 : 1,
              style: TextStyle(
                color: titleColor,
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
