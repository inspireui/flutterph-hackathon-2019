// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'dart:html' as html;

import 'package:flutterph_hackathon2019/common/constants/constants.dart';
import 'package:flutterph_hackathon2019/common/widgets/widgets.dart';

class FPHFooter extends StatelessWidget {
  final BuildContext rootContext;

  const FPHFooter({Key key, this.rootContext}) : super(key: key);

  // TODO: At this time, desktop UI interactions are not fully complete, so a UI built with flutter_web may feel like a mobile app, even when running on a desktop browser.
  // https://stackoverflow.com/questions/56512036/how-do-i-link-http-url-to-flutter-web
  // https://stackoverflow.com/questions/56211844/flutter-web-mouse-hover-change-cursor-to-pointer
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWidget.isLargeScreen(context) ? 100 : 150,
      child: ResponsiveWidget(
        largeScreen: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFooterLinkTextView(
              'Website by Flutter Philippines',
              FPHWebsiteLinks.FLUTTER_PH,
            ),
            _buildFooterDivider(),
            _buildFooterLinkTextView(
              'Illustrations by https://icons8.com',
              FPHWebsiteLinks.ICONS8,
            ),
          ],
        ),
        smallScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFooterLinkTextView(
              'Website by Flutter Philippines',
              FPHWebsiteLinks.FLUTTER_PH,
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            _buildFooterLinkTextView(
              'Illustrations by https://icons8.com',
              FPHWebsiteLinks.ICONS8,
            ),
          ],
        ),
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
