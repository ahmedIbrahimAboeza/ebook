import 'package:bookify/Model/categories_model.dart';
import 'package:bookify/View/Screen/Categories/categories_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/service/cubit/States.dart';
import '../../../Core/service/cubit/cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookCubit.get(context);

        return FutureBuilder(
          future: cubit.categoriesList,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildCat(snapshot.data![index], context),
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                          width: double.infinity,
                        ),
                      ),
                  itemCount: snapshot.data!.length);
            } else
              return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget buildCat(CategoriesModel model, context) => InkWell(
        onTap: () {
          BookCubit.get(context).GetCategoriesDetailsData(
            model.id,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoriesListView(
              categoriesName: model.name.toString(),
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 100,
            child: Row(
              children: [
                // CachedNetworkImage(
                //   imageUrl: model.image!,
                // errorWidget: (context, url, error) => Icon(Icons.error),
                //  height: 120,
                //  width: 120,
                //  fit: BoxFit.cover,
                //  ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  model.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20),
                ),
                Spacer(),
                Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                )
              ],
            ),
          ),
        ),
      );
}
