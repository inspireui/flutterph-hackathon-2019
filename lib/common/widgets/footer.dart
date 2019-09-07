// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'dart:html' as html;

import 'package:flutterph_hackathon2019/common/constants/constants.dart';

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
          _buildFooterLinkTextView('Website by Flutter Philippines', FPHWebsiteLinks.FLUTTER_PH),
          _buildFooterDivider(),
          _buildFooterLinkTextView('Powered by Flutter for Web', FPHWebsiteLinks.FLUTTER_WEB),
          _buildFooterDivider(),
          _buildFooterLinkTextView('Illustrations by https://icons8.com', FPHWebsiteLinks.ICONS8),
        ],
      ),
    );
  }

  Widget _buildFooterLinkTextView(String title, String url) {
    return InkWell(
      onTap: () => {html.window.location.href = url},
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildFooterDivider() {
    return Text('\t|\t');
  }
}
