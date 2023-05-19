import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etamen/models/nurse_model.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  List<NurseModel> nurses = [];

  void getNurses() {
    nurses = [];
    FirebaseFirestore.instance.collection('nurses').get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        nurses.add(NurseModel.fromJson(element.data()));
        print(nurses[0].toMap());
      });
      update();
    }).catchError((error) {
      print(error);
    });
  }
}
