import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Core/widget/custom_textfield.dart';
import '../../../../constance.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN UP",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Create Your Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 26),
                  ),
                  Text(
                    "please enter info to create account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: _nameController,
                            prefixIcon: const Icon(Icons.person),
                            borderradius: 20,
                            obsecure: false,
                            onsubmit: (String? text) {},
                            keyboardtype: TextInputType.name,
                            hintText: "Name",
                            validator: (name) {
                              if (name!.isEmpty) {
                                return 'name must not be empty';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            controller: _emailController,
                            prefixIcon: const Icon(Icons.email),
                            borderradius: 20,
                            obsecure: false,
                            onsubmit: (String? text) {},
                            hintText: "Email Address",
                            keyboardtype: TextInputType.emailAddress,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'email must not be empty';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              validator: (number) {
                                if (number!.isEmpty) {
                                  return 'number must not be empty';
                                }

                                return null;
                              },
                              hintText: 'phone ',
                              keyboardtype: TextInputType.number,
                              controller: _nameController,
                              prefixIcon: const Icon(FontAwesomeIcons.phone),
                              borderradius: 20,
                              obsecure: false,
                              onsubmit: (String? text) {}),
                          const SizedBox(height: 15),
                          CustomTextFormField(
                            controller: _passwordController,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_outlined),
                            ),
                            borderradius: 20,
                            obsecure: true,
                            onsubmit: (String? text) {},
                            hintText: " Password",
                            keyboardtype: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              color: isDark ? kPrimaryDark : kPrimarylight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),

                                // side: BorderSide(color: Colors.red)
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {}
                              },
                              child: Text(
                                "SIGN UP",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'I have an account',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              TextButton(
                                onPressed: (() {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (route) => false);
                                }),
                                child: Text("LOG IN",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? kPrimaryDark
                                            : kPrimarylight)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
