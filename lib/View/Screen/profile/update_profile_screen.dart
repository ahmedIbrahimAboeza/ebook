import 'package:bookify/Core/widget/custom_button.dart';
import 'package:bookify/Core/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FontAwesomeIcons.angleLeft),
            iconSize: 18,
          ),
          title: Text(
            "Update Profile",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(30),
                child: Form(
                  child: Column(children: [
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
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.yellow),
                            child: const Icon(
                              FontAwesomeIcons.camera,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    CustomTextFormField(
                        controller: nameController,
                        prefixIcon: const Icon(Icons.person),
                        hintText: "FullName",
                        borderradius: 30,
                        obsecure: false,
                        onsubmit: (String? text) {},
                        keyboardtype: TextInputType.name),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email),
                        hintText: "email",
                        borderradius: 30,
                        obsecure: false,
                        onsubmit: (String? text) {},
                        keyboardtype: TextInputType.emailAddress),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                        controller: phoneController,
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "Number",
                        borderradius: 30,
                        obsecure: false,
                        onsubmit: (String? text) {},
                        keyboardtype: TextInputType.number),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                        controller: passwordController,
                        prefixIcon: const Icon(Icons.key_rounded),
                        hintText: "Password",
                        borderradius: 30,
                        obsecure: true,
                        onsubmit: (String? text) {},
                        keyboardtype: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      minWidth: 160,
                      height: 35,
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        // side: BorderSide(color: Colors.red)
                      ),
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateTime.now().toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 16),
                        ),
                        const Custom_button(
                          backgrounColor: Color.fromARGB(255, 245, 194, 191),
                          TextColor: Colors.redAccent,
                          text_button: "Delete",
                          border: 20,
                          height: 39,
                          width: 80,
                        )
                      ],
                    )
                  ]),
                ))));
  }
}
