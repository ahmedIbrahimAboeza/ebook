import 'package:flutter/material.dart';

import '../../../Core/widget/custom_textfield.dart';
import '../../../constance.dart';

// ignore: must_be_immutable
class DriveScreen extends StatelessWidget {
  DriveScreen({
    super.key,
  });
  TextEditingController bookName = TextEditingController();
  TextEditingController bookAuther = TextEditingController();
  TextEditingController bookYear = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drive"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg'),
              height: 100,
              width: double.minPositive,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: bookName,
              validator: (String? value) {
                return null;
              },
              borderradius: 50.0,
              keyboardtype: TextInputType.text,
              hintText: "BookName",
              obsecure: false,
              onsubmit: (String? text) {},
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: bookAuther,
              validator: (String? value) {
                return null;
              },
              hintText: "Auther",
              borderradius: 50.0,
              keyboardtype: TextInputType.text,
              obsecure: false,
              onsubmit: (String? text) {},
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: bookYear,
              validator: (String? value) {
                return null;
              },
              borderradius: 50.0,
              keyboardtype: TextInputType.text,
              obsecure: false,
              onsubmit: (String? text) {},
              hintText: "Year",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: location,
              validator: (String? value) {
                return null;
              },
              hintText: "Location",
              borderradius: 50.0,
              keyboardtype: TextInputType.text,
              obsecure: false,
              onsubmit: (String? text) {},
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: kPrimaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                // side: BorderSide(color: Colors.red)
              ),
              onPressed: () {},
              child: Text(
                "Submit",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
