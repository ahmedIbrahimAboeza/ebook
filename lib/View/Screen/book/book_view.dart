import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Core/service/cubit/States.dart';
import '../../../Core/service/cubit/cubit.dart';
import '../../../Model/book_model.dart';
import 'book_details_view.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder(
                  future: cubit.bookList,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            "New Book",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return BuildNewBook(
                                      snapshot.data![index], context);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 4,
                                  );
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "TopBook  ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return BuildBookView(
                                      snapshot.data![index], context);
                                },
                              )),
                        ],
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget BuildNewBook(BookModel model, context) {
  return Image.network(
    "http://ahmed686-001-site1.atempurl.com/${model.imageUrl}",
  );
}

Widget BuildBookView(BookModel model, context) {
  return GestureDetector(
    onTap: () {
      BookCubit.get(context).GetBookDetailsData(model.id);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BookDetailsView()));
    },
    child: SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'http://ahmed686-001-site1.atempurl.com/${model.imageUrl}',
            height: 180,
            width: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    "${model.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${model.authorName}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "${model.publisher}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(
                          width: 6.3,
                        ),
                        Text(
                          "Copies(${model.copies})",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "Renal(${model.isAvailableForRental})",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
