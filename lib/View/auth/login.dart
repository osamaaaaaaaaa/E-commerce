import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/View/Home/Homepage.dart';

import 'package:flutter_app/View/widgets/Custombutton.dart';
import 'package:flutter_app/View/widgets/Customtextfield.dart';
import 'package:flutter_app/const/const.dart';
import 'package:flutter_app/controller/Authviewmodel.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:get/get.dart';

class login extends GetWidget<Authviewmodel> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.05,
                  bottom: size.height * 0.09,
                  right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30),
                  ),
                  InkWell(
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: size.width * 0.05,
                  left: size.width * 0.05,
                  bottom: 18),
              child: Customtextfield(
                hint: 'Email',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: size.width * 0.05,
                  left: size.width * 0.05,
                  bottom: 10),
              child: Customtextfield(
                hint: 'Password',
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Custombutton(title: 'Login', ontap: () {}),
            const SizedBox(
              height: 20,
            ),
            const InkWell(
              child: Text('Forget Password'),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              child: const Text(
                '-OR-',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/google.png'),
                InkWell(
                  onTap: () {
                    controller.signInWithGoogle();
                    Get.to(Homepage());
                  },
                  child: Text('Login With Google    '),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/facebook.png'),
                const InkWell(
                  child: Text('Login With Facebook'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
