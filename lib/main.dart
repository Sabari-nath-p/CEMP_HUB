import 'package:cemp_hub/structure/gpmodel.dart';
import 'package:cemp_hub/views/Signin.dart';
import 'package:cemp_hub/views/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(grMessageAdapter().typeId)) {
    Hive.registerAdapter(grMessageAdapter());
  }
  runApp(chatu());
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
