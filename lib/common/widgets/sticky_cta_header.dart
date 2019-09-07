// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/theme/theme.dart';

import 'widgets.dart';

class FPHStickyCtaHeader extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 200,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FPHCtaButton(
            onPressed: () {
              // TODO: Link to registration form
            },
            title: 'Register Now',
            backgroundColor: FPHColors.yellow,
          ),
        ],
      ),
    );
  }
}
