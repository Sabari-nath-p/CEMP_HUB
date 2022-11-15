import 'package:cemp_hub/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  String uid;
  profile({super.key, this.uid = 'NIL'});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String name = '', status = '', interest = '', cid = '', sex = '';
  var tags = null;
  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = await preferences.getString('UID').toString();
    status = await preferences.getString('STAUTS').toString();
    interest = await preferences.getString('INTEREST').toString();
    sex = await preferences.getString('SEX').toString();
    tags = interest.split("#");
    print('Working');
    print(status);
    setState(() {});
  }

  check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cid = await preferences.getString('ID').toString();

    if (cid == widget.uid || widget.uid == "NIL") {
      getdata();
      print('checking');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    // check();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 225, 247, 165),
        width: w,
        height: h,
        child: Scaffold(
          body: Stack(
            fit: StackFit.loose,
            children: [
              SizedBox(
                  width: w,
                  height: h,
                  child: Image.asset(
                    'assets/pbg.jpg',
                    fit: BoxFit.cover,
                  )),
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
                      ],
                    ),
                  )),
              Positioned(
                top: 230,
                left: 135,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://farm3.staticflickr.com/2820/buddyicons/105778605@N07_r.jpg?1382066264#105778605@N07",
                    ),
                    backgroundColor: Colors.red.shade800,
                    radius: 50,
                  ),
                ),
              ),
              Positioned(
                  top: 385,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '  $name',
                        textAlign: TextAlign.center,
                        style: usrid(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon((sex == 'Male') ? Icons.male : Icons.female),
                          (status == 'SINGLE')
                              ? Text('SINGLE')
                              : Text('Commited')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                                left: 58,
                                child: Text(
                                  'Interested',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Positioned(
                                right: 58,
                                child: Text('Interesting',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ))),
                            Positioned(
                                top: 20,
                                left: 69,
                                child: Text('32',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ))),
                            Positioned(
                                top: 20,
                                right: 80,
                                child: Text('10',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (tags != null) skill(tags[0]),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          if (tags != null) skill(tags[1]),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          if (tags != null) skill(tags[2]),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (tags != null) skill(tags[3]),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          if (tags != null) skill(tags[4]),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  skill(String sk) {
    return Container(
      width: 80,
      height: 25,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        sk,
        style: TextStyle(
          fontSize : 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(171, 217, 215, 215)),
    );
  }
}
