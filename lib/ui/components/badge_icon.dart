import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

badgeIcon(
    {required String label, required String value, required Widget icon}) {
  return BottomNavigationBarItem(
    icon: Stack(
      children: <Widget>[
        icon,
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
    label: label,
  );
}
