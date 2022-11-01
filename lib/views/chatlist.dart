import 'package:cemp_hub/widgets/chatCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatList extends StatefulWidget {
  const chatList({super.key});

  @override
  State<chatList> createState() => _chatListState();
}

class _chatListState extends State<chatList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF990945), Color(0xFCF22077)]),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
                top: 25,
                left: 20,
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Colors.white,
                )),
            Positioned(
                top: 94,
                right: 18,
                child: Icon(
                  Icons.search_rounded,
                  size: 35,
                  color: Colors.white,
                )),
            Positioned(
              top: 83,
              left: 20,
              child: Text("Chats",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              width: w,
              height: h - 150,
              top: 150,
              child: Container(
                width: w,
                height: double.infinity,
                padding: EdgeInsets.only(left: 7, top: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(246, 255, 255, 255),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '    12 Chats',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard(),
                      chatCard()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
