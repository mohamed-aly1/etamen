import 'package:etamen/models/resevation.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

String userName = '';
String reservationdateFrom = '';
String reservationdateTo = '';
ReservationModel reservation = ReservationModel();
