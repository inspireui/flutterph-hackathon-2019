// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/common/widgets/fph_widgets.dart';

enum FPHPageSectionAlign { LEFT, RIGHT }

class FPHPageSection extends StatefulWidget {
  final double pageNumber;
  final double maxPages;
  final Size rootSize;
  final double opacity;
  final FPHPageSectionAlign fphPageSectionAlign;
  final PageController pageController;
  final String imagePath;
  final Widget contentChild;

  const FPHPageSection({
    Key key,
    this.pageNumber,
    this.maxPages,
    this.rootSize,
    this.opacity,
    this.fphPageSectionAlign,
    this.pageController,
    this.imagePath,
    this.contentChild,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FPHPageSectionState();
  }
}

class FPHPageSectionState extends State<FPHPageSection> {
  double get _pageNumber => widget.pageNumber;
  double get _maxPages => widget.maxPages;
  double get _width => widget.rootSize.width;
  double get height => widget.rootSize.height;

  double get _opacity => widget.opacity;
  FPHPageSectionAlign get _fphPageSectionAlign => widget.fphPageSectionAlign;
  PageController get _pageController => widget.pageController;
  String get _imagePath => widget.imagePath;
  Widget get _contentChild => widget.contentChild;

  Duration _opacityTransitionDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: _opacityTransitionDuration,
      opacity: _opacity,
      child: Center(
        child: Container(
          width: _width / 1.25,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: ResponsiveWidget.isLargeScreen(context)
                      ? _getInversedHorizontalAlignment()
                      : Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: _opacityTransitionDuration,
                    opacity:
                        ResponsiveWidget.isLargeScreen(context) ? 1.0 : 0.10,
                    child: Container(
                      width: ResponsiveWidget.isLargeScreen(context)
                          ? _width * 0.55
                          : _width,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.network(
                          _imagePath,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: ResponsiveWidget.isLargeScreen(context)
                      ? _getHorizontalAlignment()
                      : Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: ResponsiveWidget.isLargeScreen(context)
                          ? EdgeInsets.only(right: 50)
                          : EdgeInsets.all(0),
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
                              width: ResponsiveWidget.isLargeScreen(context)
                                  ? _width * 0.35
                                  : _width,
                              padding: EdgeInsets.all(30),
                              child:
                                  SingleChildScrollView(child: _contentChild),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _isFirstPage()
                  ? Container()
                  : Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FPHPageControl(
                          onPressed: () {
                            _pageController.animateToPage(
                              _pageNumber > 0 ? _pageNumber - 1 : 0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          controlOption: FPHPageControlOption.PREVIOUS,
                          color: Colors.black54,
                        ),
                      ),
                    ),
              _isLastPage()
                  ? Container()
                  : Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FPHPageControl(
                          onPressed: () {
                            _pageController.animateToPage(
                              _pageNumber < _maxPages
                                  ? _pageNumber + 1.0
                                  : _maxPages.toInt() - 1,
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

  Alignment _getHorizontalAlignment() {
    if(_fphPageSectionAlign == FPHPageSectionAlign.LEFT) {
      return Alignment.centerLeft;
    } else {
      return Alignment.centerRight;
    }
  }

  Alignment _getInversedHorizontalAlignment() {
    if(_fphPageSectionAlign == FPHPageSectionAlign.LEFT) {
      return Alignment.centerRight;
    } else {
      return Alignment.centerLeft;
    }
  }

  bool _isFirstPage() {
    return _pageNumber == 0;
  }

  bool _isLastPage() {
    return _pageNumber + 1 == _maxPages;
  }
}
