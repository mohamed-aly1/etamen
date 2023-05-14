import 'package:etamen/modules/reservation/reservation.dart';
import 'package:etamen/modules/reservation/resv_datails.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:flutter/material.dart';

class ResvConfirmation extends StatefulWidget {
  const ResvConfirmation({super.key});

  @override
  State<ResvConfirmation> createState() => _ResvConfirmationState();
}

class _ResvConfirmationState extends State<ResvConfirmation> {
  String location = Reservation.location;
  String visitPurpose = Reservation.visitPurpose;
  String name = Reservation.patientName;
  String sex = Reservation.sex;
  String age = Reservation.age;
  String medicalHistory = Reservation.medicalHistory;
  String notes = Reservation.notes;
  Payment? _character = Payment.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Summary",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: 350,
              height: 284,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    isThreeLine: true,
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        radius: 40,
                        backgroundImage: AssetImage("assets/nurse1.png")),
                    title: Text("Samuel Jaggy"),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                    height: 10,
                    thickness: 1,
                    color: Colors.grey[500],
                  ),
                  ListTile(
                    isThreeLine: true,
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    leading: SizedBox(),
                    title: Text("Ahmed Ali"),
                    subtitle: Text(
                        "He is professional and he deals \nwith everything easily."),
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text("4.5"),
                      ],
                    ),
                  ),
                  ListTile(
                    isThreeLine: true,
                    tileColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    leading: SizedBox(),
                    title: Text("Amr Samir"),
                    subtitle: Text("The Best Ever."),
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text("5.0"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("21/03/2023"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("26/03/2023"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("1:00 to 3:00 Pm"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("$location"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.repeat,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Once a Day"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("500 EGP"),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$name",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$age Years Old"),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$sex"),
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.grey[500],
                            ),
                            Text(
                              "$visitPurpose",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.grey[500],
                            ),
                            notes.isEmpty
                                ? Text(
                                    "No visit notes",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                : Text(
                                    "$notes",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.grey[500],
                            ),
                            Text(
                              "$medicalHistory",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(
                onpressedfunction: () {
                  Navigator.of(context).pushReplacementNamed("ResvDetails");
                },
                title: "Checkout")
          ]),
        ),
      ),
    );
  }
}
