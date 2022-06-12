import 'package:desti_alert/shared_components/about_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  /// Create profile picture widget
  Container _createProPicWidget() {
    return Container(
        width: 30,
        color: Colors.white,
        child: UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          //* user name
          accountName: const Text(
            'Desti alert',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          //* user email
          accountEmail: const Text(
            '',
            style: TextStyle(color: Colors.black),
          ),

          //* user profile pic
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10.0,
        child: Container(
          color: Colors.grey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //* profile details part
              _createProPicWidget(),

              _MenuItem(
                text: 'Alarm',
                nextPage: AboutUs(),
                icon: const Icon(
                  Icons.alarm_rounded,
                  color: Colors.greenAccent,
                ),
                onTap: () {},
              ),

              // _MenuItem(
              //   text: 'Transactions',
              //   nextPage: TransactionsScreen(),
              //   isDisabled: true,
              // ),

              _MenuItem(
                text: 'Scedule',
                nextPage: AboutUs(),
                isDisabled: false,
                icon: const Icon(
                  Icons.schedule,
                  color: Colors.black,
                ),
                onTap: () {},
              ),

              _MenuItem(
                text: 'Privacy policy',
                nextPage: AboutUs(),
                isDisabled: false,
                icon: const Icon(
                  Icons.privacy_tip,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}

/// Menu item of the drawer
class _MenuItem extends StatelessWidget {
  const _MenuItem({
    Key? key,
    required this.text,
    required this.nextPage,
    required this.onTap,
    this.isDisabled = false,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Widget nextPage;
  final VoidCallback onTap;
  final bool isDisabled;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !isDisabled,
      title: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: isDisabled ? Colors.grey : Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        // Call onTap function if it is provided (not null)
        if (onTap != null) onTap();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
    );
  }
}
