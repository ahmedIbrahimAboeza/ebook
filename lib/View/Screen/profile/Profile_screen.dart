import 'package:bookify/View/Screen/favorites/favorites.dart';
import 'package:bookify/View/Screen/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constance.dart';
import 'update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Ahmed Ibrahim",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "Test6@bookify.com",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              profileMenuWidget(
                title: "Rentals",
                // ignore: deprecated_member_use
                icon: Icons.volunteer_activism,
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                endIcon: true,
              ),
              profileMenuWidget(
                title: "Notification",
                icon: Icons.notifications,
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                endIcon: true,
              ),
              profileMenuWidget(
                title: "Favorites",
                icon: FontAwesomeIcons.heart,
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoriteScreen()));
                },
                endIcon: true,
              ),
              profileMenuWidget(
                title: "Information",
                icon: FontAwesomeIcons.info,
                onpress: () {},
                endIcon: true,
              ),
              profileMenuWidget(
                title: "LOG OUT",
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.signOut,
                onpress: () {},
                endIcon: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class profileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endIcon;
  final Color? textColor;
  const profileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onpress,
    required this.endIcon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey),
        child: Icon(
          icon,
          size: 18,
          color: isDark ? const Color(0xffFEE400) : const Color(0xff001BFF),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(.1)),
              child: const Icon(
                FontAwesomeIcons.angleRight,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
