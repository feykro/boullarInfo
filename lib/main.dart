import 'package:boularinfo/UI/courseDetailPage.dart';
import 'package:boularinfo/UI/createAccountPage.dart';
import 'package:boularinfo/UI/homeScreen.dart';
import 'package:boularinfo/UI/loginPage.dart';
import 'package:boularinfo/UI/userAccountPage.dart';
import 'package:boularinfo/models/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomeScreen(),
        '/courseDetail': (context) => const CourseDetailPage(),
        '/account': (context) => const UserAccountPage(),
      },
    );
  }
}
