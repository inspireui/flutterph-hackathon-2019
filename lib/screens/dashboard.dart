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
  // Web
  double _height = 0.0;
  double _width = 0.0;

  // Page
  PageController _pageController;
  double _currentPage = 0;
  Color _pageBackgroundColor = Colors.white60;

  // Page Transition
  Duration _opacityTransitionDuration = Duration(milliseconds: 300);
  double _opacityHeaderView = 1.0;
  double _opacityStudyJamsView = 1.0;
  double _opacityMechanicsView = 1.0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
        _hideAllViews();

        if (_currentPage == 0) {
          _pageBackgroundColor = Colors.white60;
          _opacityHeaderView = 1.0;
        } else if (_currentPage == 1) {
          _pageBackgroundColor = Color(0xfffefef3);
          _opacityStudyJamsView = 1.0;
        } else if (_currentPage == 2) {
          _pageBackgroundColor = Color(0xffffd0d2);
          _opacityMechanicsView = 1.0;
        } else if (_currentPage == 3) {
          _pageBackgroundColor = Color(0xff00ff00);
        } else if (_currentPage == 4) {
          _pageBackgroundColor = Color(0xff00ff00);
        } else {
          _pageBackgroundColor = Color(0xfffefef3);
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.width;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          color: _pageBackgroundColor,
          height: _height,
          width: _width,
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            children: <Widget>[
              _buildHeaderView(),
              _buildStudyJamsView(),
              _buildMechanicsView(),
            ],
          ),
        ),
      ),
    );
  }

  void _hideAllViews() {
    setState(() {
      _opacityHeaderView = 0.0;
      _opacityStudyJamsView = 0.0;
      _opacityMechanicsView = 0.0;
    });
  }

  Widget _buildHeaderView() {
    return AnimatedOpacity(
      duration: _opacityTransitionDuration,
      opacity: _opacityHeaderView,
      child: Center(
        child: Container(
          width: _width / 1.25,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 700,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.network(
                        'https://user-images.githubusercontent.com/20706361/64470904-eb93e980-d17c-11e9-95a1-fd4d8c8641c8.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Flutter Online Hackathon 2019',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1f1e00),
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
                          'With \$2000+ worth of prizes!',
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudyJamsView() {
    return AnimatedOpacity(
      duration: _opacityTransitionDuration,
      opacity: _opacityStudyJamsView,
      child: Center(
        child: Container(
          width: _width / 1.25,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 800,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.network(
                        'https://user-images.githubusercontent.com/20706361/64428818-467b0180-d0e7-11e9-9f9d-c2fcb0a90619.png',
                      ),
                    ),
                  ),
                ),
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }

  Widget _buildMechanicsView() {
    return AnimatedOpacity(
      duration: _opacityTransitionDuration,
      opacity: _opacityMechanicsView,
      child: Center(
        child: Container(
          width: _width / 1.25,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 600,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.network(
                        'https://user-images.githubusercontent.com/20706361/64430494-f9009380-d0ea-11e9-9513-16ef6c3db06f.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50),
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
                            height: 450,
                            width: 500,
                            padding: EdgeInsets.all(30),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SectionHeaderWidget(
                                      title: 'Registration / Mechanics'),
                                  Padding(padding: EdgeInsets.only(bottom: 16)),
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
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
        ),
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
