import 'package:etamen/modules/reservation/reservation.dart';
import 'package:etamen/modules/reservation/checkout.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResvConfirmation extends StatefulWidget {
  const ResvConfirmation({super.key});

  @override
  State<ResvConfirmation> createState() => _ResvConfirmationState();
}

class _ResvConfirmationState extends State<ResvConfirmation> {


  Payment? _character = Payment.cash;

  @override
  Widget build(BuildContext context) {
    reservedDays == 0 ? reservedDays = 1 : reservedDays == reservedDays;
    int totalPrice = userReservation.selectedNurse!.price! * reservedDays!;
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
              height: 100,
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
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(nurseName!),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        nurserating == null
                            ? Text(
                                'N/A',
                                style: TextStyle(color: Colors.black),
                              )
                            : Text(
                                '$nurserating',
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 300,
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
                        Text(fromDate!),
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
                        Text(toDate!),
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
                          Icons.payments_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("$nursePrice X $reservedDays = $totalPrice LE"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                                color: Colors.grey[500],
                              ),
                              notes == null
                                  ? Text(
                                      "No visit notes",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  : Text(
                                      "$notes",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ]),
                      ),
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
                  totalCost = totalPrice;
                  Get.to(Checkout());
                },
                title: "Checkout")
          ]),
        ),
      ),
    );
  }
}
