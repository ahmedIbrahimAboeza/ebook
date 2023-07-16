import 'package:bookify/Core/service/notificationHelper.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, this.payload});
  final String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          IconButton(
              onPressed: () async {
                NotificationHelper.Create();
              },
              icon: const Icon(Icons.notification_add))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "Hello,Ahmed",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You have a new reminder",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            margin: const EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 30, 148, 178)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.text_format,
                      size: 30,
                    ),
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.description,
                      size: 30,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            )),
          )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
