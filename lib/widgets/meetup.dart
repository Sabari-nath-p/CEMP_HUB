import 'package:cemp_hub/color_const.dart';
import 'package:cemp_hub/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class meetup extends StatefulWidget {
  String gender, dt, loc;
  meetup({Key? key, required this.gender, required this.dt, required this.loc})
      : super(key: key);

  @override
  State<meetup> createState() => _meetupState(loc: loc, gender: gender, dt: dt);
}

class _meetupState extends State<meetup> {
  String gender, dt, loc;
  _meetupState(
      {required this.gender,
      required this.dt,
      // required this.name,
      required this.loc});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      //color: messcolor1(),
      width: w * .66,
      child: Container(
        margin: EdgeInsets.only(top: 2),
        alignment: Alignment.topLeft,

        //color: messcolor1(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '@sabarinath',
                  style: usr(),
                ),
                Icon(
                  (gender == 'male') ? Icons.male : Icons.female,
                  size: 14,
                )
              ],
            ),
            SizedBox(
              width: w * .66,
              height: (w * .33),
              child: LottieBuilder.network(
                'https://assets7.lottiefiles.com/packages/lf20_6aYlBl.json',
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              width: double.infinity,
              color: messcolor1(),
              child: Text(
                'Date and Time :',
                style: usr(),
              ),
            ),
            Container(
                color: messcolor1(),
                width: double.infinity,
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  dt,
                  style: messtyle(),
                )),
            Container(
              color: messcolor1(),
              width: double.infinity,
              child: Text(
                'Location ',
                style: usr(),
              ),
            ),
            Container(
              color: messcolor1(),
              width: double.infinity,
              child: Text(
                '             $loc',
                style: messtyle(),
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
