import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/models/user_model.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

String? uID;
UserModel? userModel;

class AuthController extends GetxController {
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      uID = value.user!.uid;

      userCreate(email: email, name: name, phone: phone, uID: value.user!.uid);
    }).catchError((error) {});
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    print('USER LOGIN STARTTT');
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('VVVVVVVVVVVVVVV$value');
      uID = value.user!.uid;
      print('UUUUUUUUUUUUUUU$uID');
    }).catchError((error) {
      print('wrong shit $error');
    });
    print('USER LOGIN END');
    print('UUUUUUUUUUUUUUU$uID');
  }

  void getUserName() async {
    print('USERRRRRRRRR $uID');
    FirebaseFirestore.instance.collection('users').doc(uID).get().then((value) {
      final data = value.data();
      userName = data!['name'];
    });
    print(userName);
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uID,
  }) {
    UserModel model =
        UserModel(name: name, email: email, phone: phone, uID: uID);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(model.toMap())
        .then((value) => Get.offAll(HomeLayout()))
        .catchError((error) {});
  }

  void getUser() {
    FirebaseFirestore.instance.collection('users').doc(uID).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print('GETTTT USEREEEEE${value.data()}');
    }).catchError((error) {});
  }
}
