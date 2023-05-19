import 'package:etamen/controllers/auth_controller.dart';
import 'package:etamen/models/resevation_model.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/reservation_controller.dart';

List<String> list = <String>['Male', 'Female'];
Map<String, dynamic> reservationInfo = {
  'time': 'time',
  'dateFrom': reservationdateFrom,
  'dateTo': reservationdateTo,
  'location': 'location',
  'visitPurpose': 'visitPurpose',
  'patientName': 'patientName',
  'patientAge': 'patientAge',
  'medicalHistory': 'medicalHistory',
  'notes': 'notes',
  'gender': 'gender',
};

class Reservation extends StatefulWidget {
  static String visitPurpose = "";
  static String patientName = "";
  static String sex = "";
  static String age = "";
  static String medicalHistory = "";
  static String notes = "";
  static String location = "";
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final ReservationController c = Get.put(ReservationController());
  String dropdownValue = list.first;
  bool? services;
  LocationPermission? permission;
  Position? currentlocation;
  bool read = true;
  String country = "";
  String area = "";
  String street = "";
  String hinttext = "Location";
  var visitPurposeController = TextEditingController();
  var patientNameController = TextEditingController(text: userModel?.name);
  var ageController = TextEditingController();
  var medicalHistoryController = TextEditingController();
  var notesController = TextEditingController();
  var locationController = TextEditingController();

  GlobalKey<FormState> reserveformKey = new GlobalKey<FormState>();
  @override
  void initState() {
    getLocation();

    super.initState();
  }

  Future getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {
      getlondAndlat();
    }
  }

  Future getlondAndlat() async {
    currentlocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    _currentLocation();
  }

  Future _currentLocation() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentlocation!.latitude, currentlocation!.longitude);
    country = placemarks[0].country!;
    area = placemarks[0].administrativeArea!;
    street = placemarks[0].street!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Details",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: reserveformKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(reservationdateFrom),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(reservationdateTo),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    readOnly: read,
                    prefixIcon: Icon(Icons.location_on),
                    controller: locationController,
                    validateFun: (String? val) {
                      if (val!.isEmpty) {
                        return "Must not be empty";
                      }
                    },
                    hintText: 'Location'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    defaultButton(
                        size: 16,
                        width: 150,
                        onpressedfunction: () {
                          setState(() {
                            read = true;
                            _currentLocation();
                            locationController.text = "$country $area $street";
                          });
                        },
                        title: "Auto Select"),
                    SizedBox(
                      width: 10,
                    ),
                    defaultButton(
                        size: 16,
                        width: 150,
                        onpressedfunction: () {
                          setState(() {
                            read = false;
                          });
                        },
                        title: "Enter Manually"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    textAlign: TextAlign.center,
                    maxlines: 2,
                    keyboardType: TextInputType.multiline,
                    controller: visitPurposeController,
                    validateFun: (String? val) {
                      if (val!.isEmpty) {
                        return "Must not be empty";
                      }
                    },
                    hintText: "Visit Purpose"),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    textAlign: TextAlign.center,
                    controller: patientNameController,
                    validateFun: (String? val) {
                      if (val!.isEmpty) {
                        return "Must not be empty";
                      }
                    },
                    hintText: "Patient Name"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.grey[200],
                      ),
                      width: 145,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton<String>(
                          underline: Container(
                            color: Colors.grey[200],
                          ),
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    defaultTextField(
                        width: 145,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: ageController,
                        validateFun: (String? val) {
                          if (val!.isEmpty) {
                            return "Must not be empty";
                          }
                        },
                        hintText: "Age"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    textAlign: TextAlign.center,
                    maxlines: 3,
                    keyboardType: TextInputType.multiline,
                    controller: medicalHistoryController,
                    validateFun: (String? val) {
                      if (val!.isEmpty) {
                        return "Must not be empty";
                      }
                    },
                    hintText: "Medical History"),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    textAlign: TextAlign.center,
                    maxlines: 2,
                    keyboardType: TextInputType.multiline,
                    controller: notesController,
                    validateFun: (val) {},
                    hintText: "Notes"),
                SizedBox(
                  height: 10,
                ),
                defaultButton(
                    onpressedfunction: () {
                      var formd = reserveformKey.currentState;
                      if (formd!.validate()) {
                        reservationInfo['location'] = locationController.text;
                        reservationInfo['visitPurpose'] =
                            visitPurposeController.text;
                        reservationInfo['patientName'] =
                            patientNameController.text;
                        reservationInfo['gender'] = dropdownValue;
                        reservationInfo['patientAge'] = ageController.text;
                        reservationInfo['medicalHistory'] =
                            medicalHistoryController.text;
                        reservationInfo['notes'] = notesController.text;
                        print('Ffklfjsdlikfjldiewjwiuk');
                        userReservation =
                            ReservationModel.fromJson(reservationInfo);
                        print(userReservation.toMap());

                        Navigator.of(context).pushNamed("AvailableNurses");
                      }
                    },
                    title: "Search")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
