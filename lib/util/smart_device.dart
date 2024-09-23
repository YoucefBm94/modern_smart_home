import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool isSwitched;
  void Function(bool)? onChanged;

   SmartDeviceBox(
      {required this.deviceName,
      required this.iconPath,
      required this.isSwitched,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(iconPath,  height: 65),
            Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      deviceName,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                ),
                Transform.rotate(
                    angle: pi/2,

                    child: CupertinoSwitch(value: isSwitched, onChanged: (value) {
                      onChanged!(value);
                    })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
