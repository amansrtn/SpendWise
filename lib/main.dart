// ignore_for_file: deprecated_member_use

import "package:another_flutter_splash_screen/another_flutter_splash_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:spendwise/Pages/entrypage.dart";
import "package:spendwise/Pages/loginPage.dart";
import "package:spendwise/constant/constant.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAd6xqFn07xa2iPQKRdgb1gxibqc9chHbI",
      appId: "1:846297430872:android:c9b2d7d316193d082f432d",
      messagingSenderId: "846297430872",
      projectId: "spendwise-629a8",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cc = Colorclass();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: cc.background_color,
        ),
        home: FlutterSplashScreen.scale(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cc.background_color, cc.container_color, cc.white_color],
          ),
          childWidget: SizedBox(
            height: MediaQuery.of(context).size.height / 6.6,
            child: Text(
              'SpendWise',
              style: cc.textstyle,
            ),
          ),
          duration: const Duration(milliseconds: 1500),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return const EntryPage();
                } else {
                  return const LoginPage();
                }
              }),
        ));
  }
}
