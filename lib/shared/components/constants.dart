import 'package:etamen/models/resevation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

String userName = '';
String reservationdateFrom = '';
String reservationdateTo = '';
int? reservedDays;
int? totalCost;
ReservationModel userReservation = ReservationModel();
