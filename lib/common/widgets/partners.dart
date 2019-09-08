// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/responsive_widget.dart';

import 'widgets.dart';

class FPHPartners extends StatelessWidget {
  final BuildContext rootContext;

  const FPHPartners({Key key, this.rootContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Our Event Partners',
          textScaleFactor:
              ResponsiveWidget.isLargeScreen(rootContext) ? 1.25 : 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                width: ResponsiveWidget.isLargeScreen(rootContext) ? 175 : 130,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                    'https://user-images.githubusercontent.com/20706361/64491600-e9c14780-d29c-11e9-863e-c76c179e891b.png',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 10)),
              Container(
                color: Color(0xff131c24),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: ResponsiveWidget.isLargeScreen(rootContext) ? 175 : 130,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                    'https://user-images.githubusercontent.com/20706361/64491559-89caa100-d29c-11e9-89bd-b7bb26846dcd.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
