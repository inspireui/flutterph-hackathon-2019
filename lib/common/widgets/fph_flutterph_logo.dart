// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHFlutterPHLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Image.network(
        'https://avatars1.githubusercontent.com/u/47053319?s=400&u=faa28fed8002f59147835bb25df5c00f4df2cfe2&v=4',
      ),
    );
  }
}
