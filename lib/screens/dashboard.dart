// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/chip.dart';
import 'package:flutterph_hackathon2019/common/widgets/headers.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  // TODO: Make this responsive
  double _width = 1100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildHeaderView(),
              buildStudyJamsView(),
              buildMechanicsView(),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              buildFooterView(),
              Padding(padding: EdgeInsets.only(bottom: 50)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderView() {
    return Container(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 150)),
          Text(
            'Flutter Online Hackathon 2019',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            'by Flutter Philippines | October 2019',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),
          Text(
            'With up to \$\$\$ worth of prizes!',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 50)),
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
        ],
      ),
    );
  }

  Widget buildStudyJamsView() {
    return Container(
      width: _width,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 800,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                    'https://user-images.githubusercontent.com/20706361/64428818-467b0180-d0e7-11e9-9f9d-c2fcb0a90619.png',
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      elevation: 12.0,
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 450,
                        width: 500,
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SectionHeaderWidget(title: 'Study Jams'),
                              Padding(padding: EdgeInsets.only(bottom: 16)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  FPHChip(
                                    title: 'Manila',
                                    color: Colors.blue,
                                    isSelected: true,
                                  ),
                                  FPHChip(
                                    title: 'Cebu',
                                    color: Colors.blue,
                                    isSelected: false,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 24)),
                              Text(
                                'September 24, 2019',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                'Everything is a Widget, Flutter Animations',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Venue',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 24)),
                              Text(
                                'October 1, 2019',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                'State Management, RESTful APIs in Flutter',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Venue',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMechanicsView() {
    return Container(
      width: _width,
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 600,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                      'https://user-images.githubusercontent.com/20706361/64430494-f9009380-d0ea-11e9-9513-16ef6c3db06f.png'),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      elevation: 12.0,
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 400,
                        width: 400,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooterView() {
    return Row(
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
    );
  }
}
