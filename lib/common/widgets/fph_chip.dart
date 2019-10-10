// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

class FPHChip extends StatelessWidget {
  final String title;
  final Color color;
  final bool isSelected;

  const FPHChip({Key key, this.title, this.color, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: _getDecoration(),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    if (isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: color,
      );
    } else {
      return null;
    }
  }

  Color _getTextColor() {
    if (isSelected) {
      return Colors.white;
    } else {
      return color;
    }
  }
}
