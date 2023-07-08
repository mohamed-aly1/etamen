import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:etamen/layout/home_layout.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:etamen/signing/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(HomeLayout());
                    },
                    child: Text(
                      'Close',
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Thank You!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 180, height: 180, child: Image.asset('assets/done.png')),
            Container(
              width: 340,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$visitPurpose',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 80,
                      height: 10,
                      thickness: 1,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
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
                            Expanded(child: Text("$location")),
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
                            Text(
                              'Cash - $totalCost LE ',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/nurse1.png")),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              nurseName!,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Theme.of(context).primaryColor,
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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(HomeLayout());
                  },
                  icon: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Text('Cancel'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Cancel before 12 hours to get no cancellation fees.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
