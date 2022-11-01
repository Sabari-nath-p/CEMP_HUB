import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatCard extends StatefulWidget {
  const chatCard({super.key});

  @override
  State<chatCard> createState() => _chatCardState();
}

class _chatCardState extends State<chatCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: 80,
      margin: EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/1d/76/ba/1d76baa23a3a2a5ff6b983799c00847f.jpg"),
              backgroundColor: Colors.red.shade800,
              radius: 80,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '    Neynuu',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '      make your first message to make connection',
                maxLines: 1,
                softWrap: true,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          )),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                ' 20 Nov   ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
