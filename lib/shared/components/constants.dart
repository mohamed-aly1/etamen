import 'package:etamen/models/resevation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

String userName = '';
String reservationdateFrom = '';
String reservationdateTo = '';
int? reservedDays;
int? totalCost;
ReservationModel userReservation = ReservationModel();
String? location = userReservation.location;
String? visitPurpose = userReservation.visitPurpose;
String? name = userReservation.patientName;
String? sex = userReservation.gender;
String? age = userReservation.patientAge;
String? medicalHistory = userReservation.medicalHistory;
String? notes = userReservation.notes;
String? nurseName = userReservation.selectedNurse!.name;
double? nurserating = userReservation.selectedNurse!.rating;
int? nursePrice = userReservation.selectedNurse!.price;
String? fromDate = userReservation.dateFrom;
String? toDate = userReservation.dateTo;
