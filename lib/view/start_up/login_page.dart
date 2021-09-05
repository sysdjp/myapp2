import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/utils/authentication.dart';
import 'package:myapp2/view/start_up/create_accout_page.dart';
import 'package:myapp2/view/time_line/time_line_page.dart';

import '../screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  'Flutterラボ　SNS',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'メールアドレス'),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                ),
              ),
              RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
                  TextSpan(text: 'アカウントを作成していない方は'),
                  TextSpan(
                    text: 'こちら',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccoutPage()));
                      },
                  ),
                ]),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await Authentication.emailSignIn(
                      email: emailController.text, pass: passController.text);
                  if (result == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeLinePage()));
                  }
                },
                child: Text('emailでログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
