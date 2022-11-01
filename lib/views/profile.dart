import 'package:cemp_hub/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
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
                        '  Neynu',
                        textAlign: TextAlign.center,
                        style: usrid(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.female), Text('Commited')],
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
                          skill('sweet'),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          skill('Romantic'),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          skill('Singer')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          skill('Dancer'),
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          skill('Cutiee'),
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
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(171, 217, 215, 215)),
    );
  }
}
