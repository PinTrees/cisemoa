import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cisemoa/LoginPage.dart';
import 'package:cisemoa/helper/LoginPage.dart';
import 'package:cisemoa/helper/google_sgin_in.dart';
import 'package:cisemoa/helper/interfaceUI.dart';
import 'package:cisemoa/helper/style.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'helper/transition.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyADMJfLRDyCvJdCDKK0p4g41BSr1U1pnus',
          appId: '1:20870518549:web:538a1e185c73793472bb1c',
          messagingSenderId: 'G-YHGFP6YKJ5',
          projectId: 'cisemoa',
      storageBucket: 'cisemoa.appspot.com',
      authDomain: 'cisemoa.firebaseapp.com',
      measurementId: '20870518549')
  );
  MyFluroRouter.init();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: MyFluroRouter.router.generator,
        initialRoute: '/home',
       /* routes: {
          'home': (context) => MyHomePage(),
          'login': (context) => LoginPage(),
        },*/
        title: '시세모아',
        home: MyHomePage(),
      ),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        backgroundColor: StyleT.backgroundColor,
        elevation: 0,
        title: Container(
          width: 1100,
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            children: [
              WidgetT.titleBig('CISE 모아', size: 30),
              Expanded(child: SizedBox()),
              SizedBox(
                width: 32, height: 32,
                child: TextButton(
                    style: StyleT.buttonStyleOutline(
                      padding: 0, strock: 1.4, elevation: 8, color: Colors.white.withOpacity(0.5),
                    ),
                    onPressed: () async {
                      MyFluroRouter.router.navigateTo(context, '/login');
                      //Navigator.pushNamed(context, 'login');
                      //WidgetT.openPageWithFade(context, LoginPage());
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetT.iconNormal(Icons.person),
                        ],
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: StyleT.buttonStyleOutline(
                padding: 0, strock: 0.1, elevation: 8, color: Colors.white.withOpacity(1),
              ),
              onPressed: () async {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.signIn();
              },
              child: Container(
                width: 350, height: 54, padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}