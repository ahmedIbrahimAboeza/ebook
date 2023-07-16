import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/service/cubit/States.dart';
import '../../../Core/service/cubit/cubit.dart';
import '../../../Model/book_details_model.dart';
import '../../../Model/book_model.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

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
                icon: const Icon(Icons.favorite_outline), onPressed: () {})
          ],
        ),
        body: BlocConsumer<BookCubit, BookStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = BookCubit.get(context);

              return FutureBuilder(
                  future: cubit.bookDetailsList,
                  builder: (buildcontext, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, int index) {
                          for (var i = 0; i < snapshot.data!.length; i++) {
                            return BuildBookDetails(
                                snapshot.data![index], context, i);
                          }
                        },
                        itemCount: 1,
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  });
            }));
  }
}

Widget BuildBookDetails(BookDetailsModel model, context, i) {
  return Padding(
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
            child: Image.network(
              "http://ahmed686-001-site1.atempurl.com/${model.imageUrl}",
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Text(
            "${model.title}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
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
              "${model.authorName}",
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
          ],
        ),
        Text(
          " ${model.publisher}",
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Text(
              "Hall",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const Spacer(),
            Text(
              "Rental",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const Spacer(),
            Text(
              "Copies",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "${model.hall}",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
            const Spacer(),
            Text("${model.isAvailableForRental}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16)),
            const Spacer(),
            Text(
              "${model.copies}",
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "About book",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "${model.description}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
        ),
      ],
    ),
  );
}
