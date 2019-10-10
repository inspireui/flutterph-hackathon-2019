// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';
import 'package:flutterph_hackathon2019/theme/colors.dart';
import 'package:flutterph_hackathon2019/theme/theme.dart';
import 'dart:html' as html;

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  // Web
  double _height = 0.0;
  double _width = 0.0;

  // Page
  PageController _pageController;
  double _currentPage = 0;
  double _maxPage = 5;
  Color _pageBackgroundColor = Colors.white60;
  String _pageName = "";
  double _pageTitleFontSize = 120;

  // Page Transition
  Duration _opacityTransitionDuration = Duration(milliseconds: 250);
  double _opacityHeaderView = 1.0;
  double _opacityTimelineView = 1.0;
  double _opacityStudyJamsView = 1.0;
  double _opacityMechanicsView = 1.0;
  double _opacityAboutView = 1.0;

  // Study Jam
  // TODO: Convert to enums. Currently, enums is not the simple to deal with.
  bool isStudyJamShowingManilaSchedule = true;

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
          _pageName = "";
        } else if (_currentPage == 1) {
          _pageBackgroundColor = Color(0xfffefef3);
          _opacityTimelineView = 1.0;
          _pageName = "Timeline";
          _pageTitleFontSize =
              ResponsiveWidget.isLargeScreen(context) ? 120 : 70;
        } else if (_currentPage == 2) {
          _pageBackgroundColor = Color(0xffffd0d2);
          _opacityStudyJamsView = 1.0;
          _pageName = "Study Jams";
          _pageTitleFontSize =
              ResponsiveWidget.isLargeScreen(context) ? 80 : 50;
        } else if (_currentPage == 3) {
          _pageBackgroundColor = Color(0xffffe6d0);
          _opacityMechanicsView = 1.0;
          _pageName = "Mechanics";
          _pageTitleFontSize =
              ResponsiveWidget.isLargeScreen(context) ? 100 : 60;
        } else if (_currentPage == 4) {
          _pageBackgroundColor = Color(0xffffefef3);
          _opacityAboutView = 1.0;
          _pageName = "About";
          _pageTitleFontSize =
              ResponsiveWidget.isLargeScreen(context) ? 85 : 55;
        } else {
          _pageBackgroundColor = Color(0xfffefef3);
          _pageName = "";
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
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Opacity(
                    opacity: 0.10,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 700,
                      padding: ResponsiveWidget.isLargeScreen(context)
                          ? EdgeInsets.only(top: 30, left: 60)
                          : EdgeInsets.only(top: 60, left: 20),
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 250),
                        child: Text(
                          _pageName,
                          maxLines: 1,
                        ),
                        style: TextStyle(
                            fontSize: _pageTitleFontSize,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'FontTheme'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    children: <Widget>[
                      _buildHeaderView(),
                      _buildTimelineView(context),
                      _buildStudyJamsView(context),
                      _buildMechanicsView(context),
                      _buildAboutView(context)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ResponsiveWidget.isLargeScreen(context) ? 20 : 10,
                  ),
                  child: FPHPageIndicator(
                    rootContext: context,
                    currentPage: _currentPage,
                    maxPage: _maxPage,
                  ),
                ),
              ),
              // Only show footer on the last page
              _currentPage == _maxPage - 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: FPHFooter(
                        rootContext: context,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _hideAllViews() {
    setState(() {
      _opacityHeaderView = 0.0;
      _opacityTimelineView = 0.0;
      _opacityStudyJamsView = 0.0;
      _opacityMechanicsView = 0.0;
      _opacityAboutView = 0.0;
    });
  }

  // TODO: Migrate this soon to FPHPageSection
  Widget _buildHeaderView() {
    return AnimatedOpacity(
      duration: _opacityTransitionDuration,
      opacity: _opacityHeaderView,
      child: Center(
        child: Container(
          width: _width * 0.90,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Opacity(
                  opacity: ResponsiveWidget.isLargeScreen(context) ? 1.0 : 0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: 0.10,
                      child: Container(
                        width: ResponsiveWidget.isLargeScreen(context)
                            ? _width * 0.55
                            : _width,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.network(
                            'https://user-images.githubusercontent.com/20706361/64470904-eb93e980-d17c-11e9-95a1-fd4d8c8641c8.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: ResponsiveWidget.isLargeScreen(context) ? 1.0 : 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      width: _width * 0.10,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.network(
                          'https://avatars1.githubusercontent.com/u/47053319?s=400&u=faa28fed8002f59147835bb25df5c00f4df2cfe2&v=4',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Flutter Online Hackathon 2019',
                        textScaleFactor: ResponsiveWidget.isLargeScreen(context)
                            ? 2.5
                            : 1.25,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FPHColors.yellow,
                        ),
                      ),
                      Text(
                        'by Flutter Philippines | October 2019',
                        textScaleFactor: ResponsiveWidget.isLargeScreen(context)
                            ? 1.25
                            : 0.75,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: ResponsiveWidget.isLargeScreen(context)
                                  ? 50
                                  : 20)),
                      Text(
                        'With over P100,000 worth of prizes to win!',
                        textScaleFactor:
                            ResponsiveWidget.isLargeScreen(context) ? 3.5 : 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FPHColors.blue,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Row(
                        children: <Widget>[
                          FPHCtaButton(
                            rootContext: context,
                            onPressed: () {
                              html.window.open(
                                  "https://bit.ly/flutterph-hackathon-2019",
                                  "FPH");
                            },
                            title: 'Register',
                            titleColor: Colors.white,
                            backgroundColor: FPHColors.yellow,
                          ),
                          Padding(padding: EdgeInsets.only(right: 20)),
                          FPHCtaButton(
                            rootContext: context,
                            onPressed: () {
                              html.window.open(
                                  "http://bit.ly/flutterph-hackathon2019-sponsors",
                                  "FPH-Sponsors");
                            },
                            title: 'Become a partner',
                            titleColor: FPHColors.yellow,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      Container(
                        width: ResponsiveWidget.isLargeScreen(context)
                            ? _width * 0.50
                            : double.infinity,
                        child: Text(
                          'Be part of the first-ever Flutter Hackathon here in the Philippines! Our goal is to help teams, developers, and companies develop and ship beautiful and powerful apps using Flutter/Dart.',
                          textScaleFactor:
                              ResponsiveWidget.isLargeScreen(context)
                                  ? 1.25
                                  : 1,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      FPHPoweredBy(rootContext: context),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      FPHPartners(rootContext: context),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FPHPageControl(
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    controlOption: FPHPageControlOption.NEXT,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineView(BuildContext size) {
    return FPHPageSection(
      pageNumber: 1,
      maxPages: _maxPage,
      rootSize: MediaQuery.of(context).size,
      opacity: _opacityTimelineView,
      fphPageSectionAlign: FPHPageSectionAlign.RIGHT,
      imagePath:
          "https://user-images.githubusercontent.com/20706361/64471408-09188180-d184-11e9-83dc-1ec1005d892b.png",
      pageController: _pageController,
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SectionHeaderWidget(title: 'Timeline'),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'September 2019',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.blue,
            ),
          ),
          Text(
            'Study Jams (Manila x Cebu)',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'October 2019',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Flutter Online Hackathon 2019',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'November 2019',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.red,
            ),
          ),
          Text(
            'Announcement of winners',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudyJamsView(BuildContext context) {
    return FPHPageSection(
      pageNumber: 2,
      maxPages: _maxPage,
      rootSize: MediaQuery.of(context).size,
      opacity: _opacityStudyJamsView,
      fphPageSectionAlign: FPHPageSectionAlign.LEFT,
      imagePath:
          "https://user-images.githubusercontent.com/20706361/64428818-467b0180-d0e7-11e9-9f9d-c2fcb0a90619.png",
      pageController: _pageController,
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SectionHeaderWidget(title: 'Study Jams'),
          Padding(padding: EdgeInsets.only(bottom: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    isStudyJamShowingManilaSchedule = true;
                  });
                },
                child: FPHChip(
                  title: 'Manila',
                  color: Colors.blue,
                  isSelected: isStudyJamShowingManilaSchedule,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isStudyJamShowingManilaSchedule = false;
                  });
                },
                child: FPHChip(
                  title: 'Cebu',
                  color: FPHColors.red,
                  isSelected: !isStudyJamShowingManilaSchedule,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          _buildStudyJamsScheduleView()
        ],
      ),
    );
  }

  Widget _buildStudyJamsScheduleView() {
    if (isStudyJamShowingManilaSchedule) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'September 24, 2019',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Everything is a Widget, Flutter Animations',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '30th floor Freelancer.com HQ, 32nd St. cor 9th Ave., Taguig City.',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Container(
            width: ResponsiveWidget.isLargeScreen(context) ? 175 : 130,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image.network(
                'https://user-images.githubusercontent.com/20706361/64528629-8fc38f00-d33b-11e9-9897-637f02015f10.png',
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'October 1, 2019',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'State Management, RESTful APIs in Flutter',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '5th floor Recruitday, Paseo Center, Makati City',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Container(
            color: Color(0xff131c24),
            padding: EdgeInsets.only(top: 5, bottom: 5),
            width: ResponsiveWidget.isLargeScreen(context) ? 175 : 130,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Image.network(
                'https://user-images.githubusercontent.com/20706361/64491559-89caa100-d29c-11e9-89bd-b7bb26846dcd.png',
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Date',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Topic',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Venue',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'Date',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Topic',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Venue',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildMechanicsView(BuildContext context) {
    return FPHPageSection(
      pageNumber: 3,
      maxPages: _maxPage,
      rootSize: MediaQuery.of(context).size,
      opacity: _opacityMechanicsView,
      fphPageSectionAlign: FPHPageSectionAlign.RIGHT,
      imagePath:
          "https://user-images.githubusercontent.com/20706361/64430494-f9009380-d0ea-11e9-9513-16ef6c3db06f.png",
      pageController: _pageController,
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SectionHeaderWidget(
            title: 'Mechanics',
          ),
          Padding(padding: EdgeInsets.only(bottom: 16)),
          Text(
            'Members',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.blue,
            ),
          ),
          Text(
            'Gather a team of 4* creative thinkers',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '*Minimum of 2 and maximum of 4 members.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
          ),
          Text(
            'Theme',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Productivity/Utility or Game',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'You may build anything under the sun as long as it is within the stated categories',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
          ),
          Text(
            'Submission',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.red,
            ),
          ),
          Text(
            'Upload your projects on Github',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'We\'re passionate in supporting the open-source community. Showcase your project in a form of demo video, upload it to Google Play Store, or host your Flutter Web project online!',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'Deployment',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.blue,
            ),
          ),
          Text(
            'Ship that app!',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Special prizes await for those teams who can ship their apps to Google Play Store.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutView(BuildContext context) {
    return FPHPageSection(
      pageNumber: 4,
      maxPages: _maxPage,
      rootSize: MediaQuery.of(context).size,
      opacity: _opacityAboutView,
      fphPageSectionAlign: FPHPageSectionAlign.LEFT,
      imagePath:
          "https://user-images.githubusercontent.com/20706361/64478661-ee72f680-d1dd-11e9-9865-b0424130b1b7.png",
      pageController: _pageController,
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SectionHeaderWidget(title: 'About'),
          Padding(padding: EdgeInsets.only(bottom: 16)),
          Text(
            'The Website',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.blue,
            ),
          ),
          Text(
            'We use the technical preview of Flutter for Web to develop this website',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Flutter Web is not yet officially released, some features might not work or might be unstable. Our team is one of the early adopters of Flutter, here in the Philippines.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 24)),
          Text(
            'Contribution',
            textScaleFactor: ResponsiveWidget.isLargeScreen(context) ? 1.25 : 1,
            style: TextStyle(
              color: FPHColors.yellow,
            ),
          ),
          Text(
            'Our website is open-source*, feel free to submit PRs for fixes, improvements on Github',
            textScaleFactor:
                ResponsiveWidget.isLargeScreen(context) ? 1.75 : 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'This website was made in just under 24 hours, but we ran out of coffee! *We\'re just cleaning it up for you.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
