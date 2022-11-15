import 'package:cemp_hub/color_const.dart';
import 'package:flutter/cupertino.dart';

DateCard(String value) {
  return Container(
    width: double.infinity,
    height: 30,
    margin: EdgeInsets.only(top: 5, bottom: 5),
    alignment: Alignment.center,
    child: Container(
      width: 130,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44), color: messcolor1()),
      child: Text(
        '$value',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
