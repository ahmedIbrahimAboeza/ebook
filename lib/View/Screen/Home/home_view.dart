import 'package:bookify/View/Screen/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Core/service/cubit/States.dart';
import '../../../Core/service/cubit/cubit.dart';
import 'navigation_drower.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = BookCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.ChangeTheme();
                  },
                  icon: const Icon(Icons.dark_mode)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                  icon: const Icon(Icons.notification_important))
            ],
          ),
          drawer: const NavigationDrower(),
          body: cubit.screen[cubit.initialIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.initialIndex,
            onTap: (value) {
              cubit.ChangeBottomNavIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.book), label: "Books"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books), label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
