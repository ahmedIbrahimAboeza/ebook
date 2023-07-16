import 'package:bookify/View/Screen/Setting/setting_screen.dart';
import 'package:flutter/material.dart';

import '../Sign/login_screen.dart';
import '../donation/donation.dart';
import '../drive/drive.dart';
import 'home_view.dart';

class NavigationDrower extends StatelessWidget {
  const NavigationDrower({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [buildMenuItem(context)],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            runSpacing: 10,
            children: [
              ListTile(
                leading: const Icon(Icons.home_filled),
                title:
                    const Text("Home", style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeView()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.volunteer_activism_outlined),
                title: const Text("Donation",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.drive_eta_rounded),
                title: const Text("Drive",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DriveScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Setting",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingScren()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text("logout",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("help",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
