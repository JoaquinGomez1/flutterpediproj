import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

badgeIcon({required String label, String? value, required Widget icon}) {
  var shouldBeVisible = (value != null && value != "0");
  double badgeSize = 14;

  return BottomNavigationBarItem(
    icon: Stack(
      children: <Widget>[
        icon,
        Positioned(
          top: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: Duration(
              milliseconds: 200,
            ),
            opacity: shouldBeVisible ? 1 : 0,
            curve: Curves.easeInOut,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              height: badgeSize,
              width: badgeSize,
              child: Text(
                value!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
    label: label,
  );
}
