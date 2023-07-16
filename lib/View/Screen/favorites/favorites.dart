import 'package:bookify/Model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: //cubit.favoriteModel?.data == null
          // ? const Center(
          // child: Text(""),
          //  )
          SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      width: double.infinity,
                      child: BuildFavoriteItem(
                          // model: cubit.favoriteModel!.data.data[i].product,
                          context: context));
                },
                separatorBuilder: (context, i) {
                  return Divider(
                      color: Colors.black.withOpacity(0.1), thickness: 2);
                },
                itemCount: 1
                //cubit.favoriteModel?.data.data.length ?? 0),
                )
          ]),
        ),
      ),
    );
  }

  Widget BuildFavoriteItem({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "http://ahmed686-001-site1.atempurl.com/images/books/thumb/0a273722-3f21-4502-abf8-8f50a9ad3e68.jpg",
              height: 120,
              width: 100,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                height: 110,
                // padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joanne Harris',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // this is not enabled => needed to add logic for it
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
