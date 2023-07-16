import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/service/LoginCubit/LoginCubit.dart';
import 'Core/service/cubit/States.dart';
import 'Core/service/cubit/cubit.dart';
import 'Core/service/notificationHelper.dart';
import 'Core/utiles/themes.dart';
import 'View/Screen/Splash/Splash_Screen.dart';
import 'constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopRegisterCubit(),
        ),
        BlocProvider(
            create: (context) => BookCubit()
              ..GetBookData()
              ..GetCategoriesData()),
      ],
      child: BlocConsumer<BookCubit, BookStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //var cubit = BookCubit.get(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDark ? darkTheme : lightTheme,
              home: const SplashScreen());
        },
      ),
    );
  }
}
