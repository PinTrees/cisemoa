import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/google_sgin_in.dart';
import 'helper/interfaceUI.dart';
import 'helper/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      WidgetT.iconNormal(FontAwesomeIcons.google, size: 20),
                      SizedBox(width: 12,),
                      WidgetT.textBig('구글 아이디로 로그인',),
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