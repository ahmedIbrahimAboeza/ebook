import 'package:bookify/Model/categories_details_model.dart';
import 'package:bookify/View/Screen/Categories/categories_details.dart';
import 'package:bookify/View/Screen/book/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Core/service/cubit/States.dart';
import '../../../Core/service/cubit/cubit.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key, required this.categoriesName});

  final String categoriesName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "${categoriesName}  ",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
            body: FutureBuilder(
                future: cubit.categoriesDetailsList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return BuildCategoriesListView(
                                    context, snapshot.data![index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 4,
                                  height: 4,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                }));
      },
    );
  }
}

Widget BuildCategoriesListView(context, CategoriesDetailsModel model) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    GestureDetector(
      onTap: () {
        BookCubit.get(context).GetBookDetailsData(
          model.id,
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BookDetailsView()));
      },
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.network(
                    "http://ahmed686-001-site1.atempurl.com/${model.imageUrl}",
                    width: 100,
                  ),
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
                      const SizedBox(
                        height: 4.6,
                      ),
                      Text(
                        "Rental(${model.isAvailableForRental})",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 14),
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
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  ]);
}
