
import 'package:cemp_hub/constants.dart';
import 'package:flutter/material.dart';

import '../color_const.dart';

grpmessageright(String name, String message, String gender) {
  return Container(
    alignment: Alignment.topLeft,
    width: double.infinity,
    margin: EdgeInsets.only(left: 10, right: 80, top: 5, bottom: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: messcolor1(), borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  Icon(Icons.male)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '$message',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
