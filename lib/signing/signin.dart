import 'package:etamen/shared/components/compnents.dart';
import 'package:etamen/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';
import '../layout/home_layout.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatelessWidget {
  final AuthController c = Get.put(AuthController());
  var emailAddress;
  var password;

  GlobalKey<FormState> formk = new GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/signicon.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 60,
                ),
                Form(
                  key: formk,
                  child: Column(
                    children: [
                      defaultTextField(
                        controller: emailController,
                        validateFun: (String? val) {
                          if (val!.isEmpty) {
                            return "Must not be empty";
                          }
                        },
                        hintText: 'Email',
                        suffixIcon: Icon(
                          Icons.mail,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => defaultTextField(
                          obscureText: obsc.value,
                          controller: passwordController,
                          validateFun: (String? val) {
                            if (val!.isEmpty) {
                              return "Must not be empty";
                            }
                          },
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(passicon),
                            iconSize: 20,
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              c.passIcon();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            defaultButton(
                                onpressedfunction: () async {
                                  var formd = formk.currentState;
                                  if (formd!.validate()) {
                                    c.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    
                                  } else {}
                                  ;
                                },
                                title: "Sign In"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ])),
        )));
  }
}
