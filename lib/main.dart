import 'package:flutter/material.dart';
import 'package:gdg_test/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBpjD_X0TT1rC5Ti5IlxduR1MGrVLgADg4",
      appId: "1:853577590570:android:a38f03a5ae453bd822a053",
      messagingSenderId: "853577590570",
      projectId: "gdg-promotion-app-dbcdc",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
