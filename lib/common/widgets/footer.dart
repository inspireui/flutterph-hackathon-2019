// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHFooter extends StatelessWidget {
  final double height;

  const FPHFooter({Key key, this.height}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Illustrations by https://icons8.com\t|\tWebsite by Flutter Philippines\t|\tPowered by Github Pages',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
