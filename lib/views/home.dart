import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cemp_hub/color_const.dart';
import 'package:cemp_hub/converter/MtoO.dart';
import 'package:cemp_hub/structure/gpmodel.dart';
import 'package:cemp_hub/views/chatlist.dart';
import 'package:cemp_hub/views/profile.dart';
import 'package:cemp_hub/widgets/datecard.dart';
import 'package:cemp_hub/widgets/grpmessaga.dart';
import 'package:cemp_hub/widgets/meetup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;
  chatList ch = chatList();
  profile pp = profile();
  bool keyboard = true;
  List message = [];
  List mlist = [];
  TextEditingController typbox = TextEditingController();
  String uid = '';
  String id = '';
  String gender = '';
  int newMess = 2;
  String date = '0';

  FirebaseFirestore cd = FirebaseFirestore.instance;
  downloadMessage(String last) async {
    var box = await Hive.openBox('GROUPCHAT');

    cd
        .collection('GROUP')
        .orderBy('DT')
        .startAfter([last])
        .get()
        .then((value) async {
          print(value);
          if (value.size > 0) {
            newMess = 1;
          } else {
            message.add(DateCard('Unread Message'));
            newMess = 1;
          }
          for (var m in value.docs) {
            List rt = MessagetoObject(m);
            await box.put(m.id, rt[0]);
            print(box.get(m.id));
            print(m.id);
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('GRPLASTMESSAGE', m.get('DT'));

            DateTime dateTime = DateTime.parse(rt[0].dt);
            String d = DateFormat('yyyyMMdd').format(dateTime);
            if (date != d) {
              String d = DateFormat('dd-MMM').format(dateTime);
              message.add(d);
            }
            setState(() {
              message.add(rt[1]);
            });
            if (newMess == 1) {
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeOut);
              newMess = 0;
            }
            setState(() {});
          }
        });
  }

  @override
  void initState() {
    // TODO: implement initState

    //addmessage();
    loadlocalMessage();
    usersetup();
    //downloadMessage('20221113031848');
    messageListerner();
  }

  messageListerner() {
    cd
        .collection('LISTENER')
        .doc('GROUPMESSAGE')
        .snapshots()
        .listen((event) {})
        .onData((data) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String last = pref.getString('GRPLASTMESSAGE').toString();
      if (last == 'null') {
        last = '0';
      }
      downloadMessage(last);
    });
  }

  usersetup() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('ID').toString();
    uid = pref.getString('UID').toString();
    gender = pref.getString("SEX").toString();
  }

  loadlocalMessage() async {
    print('check working');
    Box llMessage = await Hive.openBox('GROUPCHAT');
    for (var m in llMessage.keys) {
      print(m);
      grMessage? gm = llMessage.get(m);

      if (gm != null) {
        DateTime dateTime = DateTime.parse(gm.dt);
        String d = DateFormat('yyyyMMdd').format(dateTime);
        if (date != d) {
          String d = DateFormat('dd-MMM').format(dateTime);
          String t = DateFormat('yyyyMMdd').format(dateTime);
          date = t;

          message.add(DateCard(d));
        }
        setState(() {
          message.add(grpmessageright(gm.uid, gm.content, gm.sex, gm.dt));
        });
      }
    }
    setState(() {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  ScrollController scrollController = new ScrollController();
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
            if (_selectedIndex == 2) ch, // chatlist view
            if (_selectedIndex == 3) pp, // profile view
            if (_selectedIndex == 0)
              Positioned(
                  top: h * .07,
                  bottom: w * .17,
                  width: w,
                  // height: h - w * .07 - -w * .17,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // message[0],
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
                                Expanded(
                                    child: InkWell(
                                        onTap: () {}, child: Icon(Icons.close)))
                              ],
                            )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            String dtvalue = DateFormat("yyyyMMddhhmmss")
                                .format(DateTime.now());

                            print(DateTime.now());
                            if (typbox.text != '') {
                              setState(() {
                                cd
                                    .collection('GROUP')
                                    .doc(DateTime.now().toString())
                                    .set({
                                  'CONTENT': typbox.text.trim(),
                                  'ID': id,
                                  'KEY': '$uid#$gender',
                                  'DT': DateTime.now().toString()
                                });
                                cd
                                    .collection('LISTENER')
                                    .doc('GROUPMESSAGE')
                                    .set({"last": DateTime.now().toString()});
                                typbox.clear();
                                newMess = 1;
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
}
