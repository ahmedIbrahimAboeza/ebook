import 'package:flutter/material.dart';

import '../../../constance.dart';

// ignore: must_be_immutable
class SettingScren extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SettingScren({super.key});
  @override
  Widget build(BuildContext context) {
    // return ConditionalBuilder(
    //     condition: ShopLoginCubit.get(context).userModel != null,
    //     builder: (BuildContext context) {
    //       var model = ShopLoginCubit.get(context).userModel;

    //       nameController.text = model!.data!.name;

    //       emailController.text = model.data!.email;
    //       phoneController.text = model.data!.phone;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Not Valide name";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: emailController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Not Valide Email";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: phoneController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Not Valide phone";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {
                signOut(context);
              },
              child: const Text(
                "LOGOUT",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
