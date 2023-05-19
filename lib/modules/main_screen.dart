import 'package:etamen/controllers/reservation_controller.dart';
import 'package:etamen/modules/recent_cares.dart';
import 'package:etamen/modules/top%20nurses.dart';
import 'package:etamen/modules/visit_notes.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../shared/components/compnents.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ReservationController c = Get.put(ReservationController());
  var fromdateController = TextEditingController();
  var todateController = TextEditingController();
  int reservationRadio = 0;
  DateTime? fromdate;
  DateTime? todate;
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void _reservationRadioFun(int? value) {
    setState(() {
      reservationRadio = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Column(
                  children: [
                    Text('From'),
                    defaultTextField(
                      width: 160,
                      prefixIcon: const Icon(Icons.date_range),
                      keyboardType: TextInputType.datetime,
                      controller: fromdateController,
                      onTapFun: () async => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2090-12-31"))
                          .then((value) {
                        fromdate = value;
                        fromdateController.text =
                            DateFormat.yMMMd().format(value!);
                      }).catchError((error) {
                        print("error is $error");
                      }),
                      validateFun: (String? val) {
                        if (val!.isEmpty) {
                          return "Must not be empty";
                        }
                      },
                      hintText: "Start Date",
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('To'),
                  defaultTextField(
                    width: 160,
                    prefixIcon: Icon(
                      Icons.date_range,
                    ),
                    keyboardType: TextInputType.datetime,
                    controller: todateController,
                    onTapFun: () async => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse("2090-12-31"))
                        .then((value) {
                      todate = value;
                      todateController.text = DateFormat.yMMMd().format(value!);
                    }).catchError((error) {
                      print("error is $error");
                    }),
                    validateFun: (String? val) {
                      if (val!.isEmpty) {
                        return "Must not be empty";
                      }
                    },
                    hintText: "End Date",
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          defaultButton(
              width: 210,
              onpressedfunction: () {
                reservationdateFrom = fromdateController.text;
                reservationdateTo = todateController.text;
                print(reservationdateFrom);
                print(reservationdateTo);
                c.getNurses();

                reservedDays = daysBetween(fromdate!, todate!);
                print('$reservedDays');
                Navigator.of(context).pushNamed("Reservation");
              },
              title: "Search Nurses"),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Get.to(VisitNotes());
                        },
                        icon: Icon(
                          Icons.note_alt_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Visit\nNotes",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Get.to(TopNurses());
                        },
                        icon: Icon(
                          Icons.medical_information_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Top\n Nurses",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Get.to(History());
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recent\n Cares",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 2,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: 300,
                height: 115,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ask For A Nurse !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Find the nearest nurse \navailable in your area\n to get a home care.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      'assets/syringe.png',
                      scale: 1.5,
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
