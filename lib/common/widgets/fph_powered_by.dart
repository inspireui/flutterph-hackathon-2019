// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';

class FPHPoweredBy extends StatelessWidget {
  final BuildContext rootContext;

  const FPHPoweredBy({Key key, this.rootContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Powered By',
          textScaleFactor:
              ResponsiveWidget.isLargeScreen(rootContext) ? 1.25 : 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          width: ResponsiveWidget.isLargeScreen(rootContext) ? 200 : 150,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.network(
              'https://user-images.githubusercontent.com/20706361/64528616-8803ea80-d33b-11e9-8b5d-1c1eb8a154f5.png',
            ),
          ),
        ),
      ],
    );
  }
}
