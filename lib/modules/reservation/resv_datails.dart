import 'package:etamen/modules/reservation/reservation.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:flutter/material.dart';

class ResvDetails extends StatefulWidget {
  const ResvDetails({super.key});

  @override
  State<ResvDetails> createState() => _ResvDetailsState();
}

enum Payment { card, cash }

class _ResvDetailsState extends State<ResvDetails> {
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
    print(notes);
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                RadioListTile<Payment>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  tileColor: Colors.grey[200],
                  title: Row(
                    children: [
                      Icon(
                        Icons.credit_card_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Credit/Debit Card',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  value: Payment.card,
                  groupValue: _character,
                  onChanged: (Payment? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.payment,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '********7955',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[200],
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Card',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RadioListTile<Payment>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  tileColor: Colors.grey[200],
                  title: Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Cash',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  value: Payment.cash,
                  groupValue: _character,
                  onChanged: (Payment? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  tileColor: Colors.grey[200],
                  title: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        '560',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultButton(
                    onpressedfunction: () {
                      Navigator.of(context).pushReplacementNamed("Completed");
                    },
                    title: "Reserve")
              ],
            )
          ],
        ),
      ),
    );
  }
}
