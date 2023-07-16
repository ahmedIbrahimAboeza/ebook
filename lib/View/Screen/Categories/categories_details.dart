import 'package:flutter/material.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {})
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.height * 0.29,
                  child: Image.asset(
                    "assets/test_image.png",
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  "The Jungle Book",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  const Icon(Icons.edit_outlined),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "j.k Rowling",
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                ],
              ),
              Text(
                " published",
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "Hall",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "Rental",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "Copies",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "11",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Text("2500",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16)),
                  const Spacer(),
                  Text(
                    "5",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About book",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "About book",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
