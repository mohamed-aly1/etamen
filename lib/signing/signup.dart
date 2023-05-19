import 'package:etamen/signing/signin.dart';
import 'package:etamen/signupsplash.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../shared/components/compnents.dart';

class Signup extends StatelessWidget {
  final AuthController c = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailupController = TextEditingController();
  var passwordupController = TextEditingController();
  var phoneNoController = TextEditingController();

  GlobalKey<FormState> formk = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/signicon.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formk,
                    child: Column(
                      children: [
                        defaultTextField(
                          controller: nameController,
                          validateFun: (String? val) {
                            if (val!.isEmpty) {
                              return "Must not be empty";
                            }
                          },
                          hintText: 'Full Name',
                          suffixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailupController,
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
                            controller: passwordupController,
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
                        defaultTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: phoneNoController,
                          validateFun: (String? val) {
                            if (val!.isEmpty) {
                              return "Must not be empty";
                            }
                          },
                          hintText: 'Phone Number',
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
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
                                  onpressedfunction: () {
                                    var formd = formk.currentState;
                                    if (formd!.validate()) {
                                      c.userRegister(
                                          name: nameController.text,
                                          email: emailupController.text,
                                          password: passwordupController.text,
                                          phone: phoneNoController.text);
                                      Get.to(SignUpSplash());
                                    } else {
                                      // clr = Colors.red;
                                    }
                                    ;
                                  },
                                  title: "Sign Up"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account ?",
                                    style: TextStyle(
                                        color: Color(0xFF979797),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.off(SignIn());
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
          )),
        ));
  }
}
