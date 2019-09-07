// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHPoweredBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Powered by',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          width: 200,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Image.network(
              'https://www.freepnglogos.com/uploads/google-logo-new-history-png-9.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
        ),
      ],
    );
  }
}
