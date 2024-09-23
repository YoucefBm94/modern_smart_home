import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? func;

  SmartDeviceBox(
      {required this.deviceName,
      required this.iconPath,
      required this.powerOn,
      this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn? Colors.grey[800]:Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(iconPath, height: 65,color: powerOn? Colors.white:Colors.black,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      deviceName,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: powerOn? Colors.white:Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                        value: powerOn, onChanged: func)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
