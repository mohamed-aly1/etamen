import 'package:etamen/controllers/auth_controller.dart';
import 'package:etamen/modules/members.dart';
import 'package:etamen/modules/main_screen.dart';
import 'package:etamen/modules/notifications.dart';
import 'package:etamen/shared/components/constants.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> bodyScreen = [
    MainScreen(),
    Members(),
    Notifications(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(
          "${userModel!.name}",
          style: TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Drawer(
          width: 210,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${userModel!.name}",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 75,
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                  title: Text(
                    "About",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.shield_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/etamen.png",
                      scale: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/cc.png',
                      scale: 2,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: bodyScreen[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(136, 129, 129, 129),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.0))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            iconSize: 32,
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                  activeIcon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_rounded),
                  label: "Members",
                  activeIcon: Icon(Icons.people_outline_rounded)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notifications",
                  activeIcon: Icon(Icons.notifications_active_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
