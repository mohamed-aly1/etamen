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

  void makeReservation({
    required String userID,
    required String time,
    required String dateFrom,
    required String dateTo,
    required String location,
    required String visitPurpose,
    required String patientName,
    required String patientAge,
    required String medicalHistory,
    required String gender,
    required String notes,
    required String selectedNurseName,
    required String selectedNurseID,
    required String cost,
  }) {
    FirebaseFirestore.instance
        .collection('reservations')
        .doc()
        .set({
          'time': time,
          'dateFrom': dateFrom,
          'dateTo': dateTo,
          'location': location,
          'visitPurpose': visitPurpose,
          'patientName': patientName,
          'patientAge': patientAge,
          'medicalHistory': medicalHistory,
          'gender': gender,
          'notes': notes,
          'selectedNurseName': selectedNurseName,
          'selectedNurseID': selectedNurseID,
          'cost': cost,
        })
        .then((value) => null)
        .catchError((error) {
          print(error);
        });
  }
}
