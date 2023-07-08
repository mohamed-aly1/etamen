import 'package:etamen/controllers/reservation_controller.dart';
import 'package:etamen/models/nurse_model.dart';
import 'package:etamen/modules/reservation/resv_confirmation.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableNurses extends StatelessWidget {
  final ReservationController c = Get.put(ReservationController());
  NurseModel selectedNurse = NurseModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Choose Your Nurse",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(reservationdateFrom),
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
                  Text(reservationdateTo),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    timeButton(
                        onpressedfunction: () {}, title: "10 am - 1 pm "),
                    SizedBox(
                      width: 5,
                    ),
                    timeButton(onpressedfunction: () {}, title: "1 pm - 4 pm "),
                    SizedBox(
                      width: 5,
                    ),
                    timeButton(onpressedfunction: () {}, title: "4 pm - 7 pm "),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: c.nurses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 2),
                      child: ListTile(
                        onTap: () {
                          selectedNurse = c.nurses[index];
                          print(selectedNurse.toMap());
                          userReservation.selectedNurse = selectedNurse;
                          userReservation.cost =
                              userReservation.selectedNurse!.price! *
                                  reservedDays!;

                          ///// RESERVATION MODEL COMPLETED HERE
                          print(userReservation.selectedNurse!.toMap());
                          Get.to(ResvConfirmation());
                        },
                        isThreeLine: true,
                        tileColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            radius: 40,
                            backgroundImage: AssetImage("assets/nurse1.png")),
                        title: Text(
                          "${c.nurses[index].name}",
                          style: TextStyle(fontSize: 19),
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
                            Text(
                              "${c.nurses[index].rating}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "${c.nurses[index].price} LE/Day",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.arrow_circle_right,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
