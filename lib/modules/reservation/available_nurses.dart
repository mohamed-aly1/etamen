import 'package:etamen/shared/components/compnents.dart';
import 'package:flutter/material.dart';

class AvailableNurses extends StatefulWidget {
  const AvailableNurses({super.key});

  @override
  State<AvailableNurses> createState() => _AvailableNursesState();
}

class _AvailableNursesState extends State<AvailableNurses> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeButton(onpressedfunction: () {}, title: "10 am - 1 pm "),
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
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("ResvConfirmation");
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
              trailing: Column(
                children: [
                  Text(
                    "560 EGP",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("ResvConfirmation");
              },
              isThreeLine: true,
              tileColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 40,
                  backgroundImage: AssetImage("assets/nurse2.jpg")),
              title: Text("Joy Alcantara"),
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
                    "4.0",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    "400 EGP",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("ResvConfirmation");
              },
              isThreeLine: true,
              tileColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 40,
                  backgroundImage: AssetImage("assets/nurse3.jpg")),
              title: Text("Jessie Edin"),
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
                    "4.9",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    "650 EGP",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
