// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';
import 'dart:html' as html;
import '../theme/theme.dart';

class MobileUnsupportedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefef3),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(
                      'https://user-images.githubusercontent.com/20706361/64479079-617f6b80-d1e4-11e9-9271-15bf6293a0d1.png',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  'Flutter PH Online Hackathon 2019',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Flutter for Web is on technical preview. We\'re doing our best to support responsive widgets on mobile!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Column(
                  children: <Widget>[
                    FPHCtaButton(
                      rootContext: context,
                      onPressed: () {
                        // TODO: Link to registration form
                      },
                      title: 'Register',
                      titleColor: Colors.white,
                      backgroundColor: FPHColors.yellow,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    FPHCtaButton(
                      rootContext: context,
                      onPressed: () {
                        html.window.location.href = "http://bit.ly/flutterph-hackathon2019-sponsors";
                      },
                      title: 'Become a partner',
                      titleColor: FPHColors.yellow,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
