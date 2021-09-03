import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotsApp({
    Key? key,
    required this.currentIndex,
    required this.top,
    required this.showMenu,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: 0,
      left: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(0), shape: BoxShape.circle),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(1), shape: BoxShape.circle),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration:
                  BoxDecoration(color: getColor(2), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
