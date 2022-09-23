import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bubble/bubble.dart';
import 'package:cemp_hub/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  bool keyboard = true;
  List message = [];
  TextEditingController typbox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
            child: Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Group'),
            activeColor: Color.fromARGB(255, 153, 9, 69),
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Search'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.blue),
        ],
      ),
      body: Container(
        color: Color.fromARGB(175, 255, 255, 255),
        width: w,
        height: h,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
                top: 0,
                width: w,
                height: h * .07,
                child: Container(
                  color: Color.fromARGB(255, 153, 9, 69),
                  child: Row(
                    children: [
                      Text(
                        '  APP NAME',
                        style: GoogleFonts.architectsDaughter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      if (_selectedIndex == 0)
                        Expanded(
                            child: IconButton(
                                alignment: Alignment.centerRight,
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                )))
                    ],
                  ),
                )),
            if (_selectedIndex == 0)
              Positioned(
                  top: h * .07,
                  width: w,
                  height: h - w * .07,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < message.length; i++) message[i],
                      ],
                    ),
                  )),
            if (_selectedIndex == 0)
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: w,
                    height: w * .17,
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: w * 0.85,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(44, 153, 9, 69),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w * 0.69,
                                  child: TextField(
                                    controller: typbox,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText: 'Type your message',
                                        border: InputBorder.none),
                                  ),
                                ),
                                Expanded(child: Icon(Icons.close))
                              ],
                            )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (typbox.text != '') {
                              setState(() {
                                message.add(mess(typbox.text));
                                typbox.clear();
                              });
                            }
                          },
                          child: Icon(
                            Icons.send,
                            semanticLabel: 'Send',
                            color: appcolor1(),
                            size: w * .08,
                          ),
                        ))
                      ],
                    ),
                  ))
          ],
        ),
      ),
    )));
  }

  mess(String text) {
    return Bubble(
      margin: BubbleEdges.only(top: 10, right: 40),
      alignment: Alignment.topLeft,
      nip: BubbleNip.leftTop,
      color: Color.fromRGBO(225, 255, 199, 1.0),
      child: Text(text, textAlign: TextAlign.left),
    );
  }
}
