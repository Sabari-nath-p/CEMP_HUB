import 'package:cemp_hub/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../color_const.dart';

grpmessageright(String name, String message, String gender, String dt) {
  DateTime t = DateTime.parse(dt);
  String dtvalue = DateFormat("hh:mm a").format(t);
  return Container(
    alignment: Alignment.topLeft,
    width: double.infinity,
    margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // width: 200,
              constraints: BoxConstraints(maxWidth: 290),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: messcolor1(), borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      (gender == 'male')
                          ? Icon(
                              Icons.male,
                              size: 17,
                            )
                          : Icon(
                              Icons.male,
                              size: 17,
                            )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      '$message',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '$dtvalue',
          style: TextStyle(fontSize: 12),
        )
      ],
    ),
  );
}
