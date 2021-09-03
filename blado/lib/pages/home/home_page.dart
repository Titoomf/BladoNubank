import 'package:blado/pages/home/widgets/menu_app.dart';
import 'package:blado/pages/home/widgets/my_app_bar.dart';
import 'package:blado/pages/home/widgets/my_dots_app.dart';
import 'package:blado/pages/home/widgets/pages_view_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;

  late int _currentIndex;
  late double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    _yPosition = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    //if (_yPosition == null) {
    // _yPosition = _screenHeight * .24;
    // }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .75 : _screenHeight * .24;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .20,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top:
                _yPosition, //!_showMenu ? _screenHeight * .24 : _screenHeight * .75,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeight * .75;
              double positionTopLimit = _screenHeight * .24;
              double midlePosition = positionBottomLimit - positionTopLimit;
              midlePosition = midlePosition / 2;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition = _yPosition > positionTopLimit + midlePosition
                      ? positionBottomLimit
                      : _yPosition;
                }
                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit + midlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            showMenu: _showMenu,
            top: _screenHeight * .70,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}
