import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp2/utils/authentication.dart';

class CreateAccoutPage extends StatefulWidget {
  const CreateAccoutPage({Key? key}) : super(key: key);

  @override
  _CreateAccoutPageState createState() => _CreateAccoutPageState();
}

class _CreateAccoutPageState extends State<CreateAccoutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGalley() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            '新規登録',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    getImageFromGalley();
                  },
                  child: CircleAvatar(
                    foregroundImage: image == null ? null : FileImage(image!),
                    radius: 40,
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: '名前',
                      )),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                        controller: userIdController,
                        decoration: InputDecoration(
                          hintText: 'ユーザーID',
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                      controller: selfIntroductionController,
                      decoration: InputDecoration(
                        hintText: '自己紹介',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: 300,
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'e-mail',
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        hintText: 'パスワード',
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          userIdController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          passController.text.isNotEmpty &&
                          image != null) {
                        var result = await Authentication.signUp(
                            email: emailController.text,
                            pass: passController.text);
                        if (result == true) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Text('アカウントを作成'))
              ],
            ),
          ),
        ));
  }
}
