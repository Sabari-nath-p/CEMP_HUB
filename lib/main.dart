import 'package:cemp_hub/views/Signin.dart';
import 'package:cemp_hub/views/signUp_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  runApp( chatu());
}

class chatu extends StatelessWidget {
  const chatu({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: signin(),
    );
  }
}
