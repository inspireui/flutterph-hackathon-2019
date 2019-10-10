// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';
import 'package:flutterph_hackathon2019/theme/theme.dart';

class FPHStickyCtaHeader extends StatelessWidget {
  final BuildContext rootContext;

  const FPHStickyCtaHeader({Key key, this.rootContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isLargeScreen(context) ? 180 : 130,
      height: ResponsiveWidget.isLargeScreen(context) ? 58 : 36,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FPHCtaButton(
            rootContext: rootContext,
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
