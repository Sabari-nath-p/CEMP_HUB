import 'package:cemp_hub/views/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController nameController = TextEditingController(),
      passwordController = TextEditingController();

  //SimpleUIController simpleUIController = Get.find<SimpleUIController>();

  final CollectionReference db = FirebaseFirestore.instance.collection('User');
  checkisLoged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String check = pref.getString('LOGIN').toString();
    if (check == 'IN') {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => Home())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkisLoged();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    bool btstatus =
        false; // to identify login button background working is completed
    return SafeArea(
        child: Container(
      width: w,
      height: h,
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LottieBuilder.asset(
                  'assets/login.json',
                  height: h * .4,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Login',
                    style: kLoginTitleStyle(size),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome Cemp Hub',
                    textAlign: TextAlign.start,
                    style: kLoginSubtitleStyle(size),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  width: w,
                  margin: EdgeInsets.symmetric(horizontal: w * .08),
                  child: TextFormField(
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: nameController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Container(
                  alignment: Alignment.center,
                  width: w,
                  margin: EdgeInsets.symmetric(horizontal: w * .08),
                  child: TextFormField(
                    style: kTextFormFieldStyle(),
                    controller: passwordController,
                    // obscureText: simpleUIController.isObscure.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility_off,
                        ),
                        onPressed: () {},
                      ),
                      hintText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 7) {
                        return 'at least enter 6 characters';
                      } else if (value.length > 13) {
                        return 'maximum character is 13';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(w * .02),
                  child: Text(
                    'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                    style: kLoginTermsAndPrivacyStyle(size),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: w * .09),
                  height: 55,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 153, 9, 69)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (!btstatus) {
                        setState(() {
                          btstatus = true;
                        });

                        String id = nameController.text.trim().toString();
                        print(id);
                        String pass = passwordController.text.trim().toString();
                        db.doc(id).get().then((value) async {
                          if (value.exists && value.get('ACTIVATE') == 'IN') {
                            if (value.get('PASSWORD') == pass) {
                              Fluttertoast.showToast(msg: 'Login ready');
                              btstatus = true;

                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString('ID', id);
                              preferences.setString(
                                  'SEX', '${value.get('GENDER')}');
                              preferences.setString(
                                  'INTEREST', '${value.get('INTEREST')}');
                              preferences.setString(
                                  'UID', '${value.get('ID')}');
                              preferences.setString(
                                  'STAUTS', '${value.get('STATUS')}');
                              preferences.setString("LOGIN", 'IN');
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) => Home()));
                              setState(() {});
                            } else {
                              Fluttertoast.showToast(msg: 'Invalid Entry');
                              setState(() {});
                              btstatus = false;
                            }
                          } else if (value.get('ACTIVATE') != 'IN') {
                            Fluttertoast.showToast(
                                msg: 'Please Register to Login');
                            btstatus = false;
                            setState(() {});
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Unknown account please contact admin');
                            btstatus = false;
                            setState(() {});
                          }
                        }).onError((error, stackTrace) {
                          btstatus = false;
                          setState(() {});
                          Fluttertoast.showToast(
                              msg: 'Something went to wrong');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Home())));
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: w * .07),
                        ),
                        if (btstatus)
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: LottieBuilder.network(
                                'https://assets8.lottiefiles.com/packages/lf20_tsxbtrcu.json',
                              ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Container(
                  width: w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      nameController.clear();
                      passwordController.clear();
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: kHaveAnAccountStyle(size),
                        children: [
                          TextSpan(
                            text: " Sign up",
                            style: kLoginOrSignUpTextStyle(
                              size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
