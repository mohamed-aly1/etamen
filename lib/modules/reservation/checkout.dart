import 'package:etamen/completed.dart';
import 'package:etamen/modules/reservation/reservation.dart';
import 'package:etamen/shared/components/compnents.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

enum Payment { card, cash }

class _CheckoutState extends State<Checkout> {
  Payment? _character = Payment.cash;

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
                        '$totalCost LE',
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
                      Get.to(Completed());
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
