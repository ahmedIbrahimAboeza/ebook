import 'package:bookify/constance.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import '../../../../Core/widget/custom_textfield.dart';
import '../Home/home_view.dart';
import 'signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool chekbook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Please Sign in to continue  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomTextFormField(
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        keyboardtype: TextInputType.emailAddress,
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email),
                        borderradius: 8,
                        obsecure: false,
                        onsubmit: (String? text) {},
                        hintText: "Email Addres",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                        borderradius: 8,
                        obsecure: true,
                        onsubmit: (String? text) {},
                        hintText: "Password",
                        keyboardtype: TextInputType.visiblePassword,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'password must not be empty';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.redAccent,
                              value: true,
                              onChanged: (value) {
                                chekbook = value!;
                              }),
                          Text(
                            "Remember me",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      ConditionalBuilder(
                          condition: true,
                          builder: (BuildContext context) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  color: isDark ? kPrimaryDark : kPrimarylight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeView()));
                                    if (_formkey.currentState!.validate()) {}
                                  },
                                  child: Text(
                                    "LOG IN",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator.adaptive())),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //   Row(
                      //    mainAxisAlignment: MainAxisAlignment.center,
                      // children: [
                      //  Text(
                      //   'Don\'t have an account',
                      //   style: Theme.of(context)
                      //      .textTheme
                      //     .bodyLarge!
                      //     .copyWith(fontSize: 16),
                      //  ),
                      //   TextButton(
                      //   onPressed: (() {
                      //    Navigator.push(
                      //      context,
                      //      MaterialPageRoute(
                      //           builder: (context) => SignUpScreen()));
                      //  }),
                      //    child: Text("SIGN UP",
                      //     style: TextStyle(
                      //         fontSize: 18,
                      //        fontWeight: FontWeight.bold,
                      //        color:
                      //             isDark ? kPrimaryDark : kPrimarylight)),
                      // )
                      //  ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
