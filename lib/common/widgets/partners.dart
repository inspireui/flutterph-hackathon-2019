// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHPartners extends StatelessWidget {
  
  final double width;

  const FPHPartners({Key key, this.width}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Our Event Partners',
          style: TextStyle(
            // TODO: Declare Dynamic Font Size
            fontSize: width * 0.0125,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width * 0.125,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network(
                  'https://via.placeholder.com/200x100',
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            Container(
              width: width * 0.125,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network(
                  'https://via.placeholder.com/200x100',
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            Container(
              width: width * 0.125,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network(
                  'https://via.placeholder.com/200x100',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
