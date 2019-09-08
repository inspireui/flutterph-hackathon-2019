// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/theme/theme.dart';

import 'widgets.dart';

class FPHStickyCtaHeader extends StatelessWidget {
  
  final double width;

  const FPHStickyCtaHeader({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.030,
      width: width * 0.125,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FPHCtaButton(
            width: width,
            onPressed: () {
              // TODO: Link to registration form
            },
            title: 'Register',
            titleColor: Colors.white,
            backgroundColor: FPHColors.yellow,
          ),
        ],
      ),
    );
  }
}
