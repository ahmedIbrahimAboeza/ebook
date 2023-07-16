import 'package:bookify/Core/service/cubit/States.dart';
import 'package:bookify/Core/service/cubit/cubit.dart';
import 'package:bookify/Core/widget/custom_textfield.dart';
import 'package:bookify/Model/search_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../book/book_details_view.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  stt.SpeechToText? _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  // ignore: unused_field
  double _confidence = 1.0;

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BookCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: CustomTextFormField(
                            controller: searchController,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search Her ..",
                            borderradius: 15,
                            keyboardtype: TextInputType.text,
                            obsecure: false,
                            onChange: (String? text) {
                              text = searchController.text;
                              cubit.GetSearchData(text.toString());
                            },
                            onsubmit: (String? text) async {
                              text = searchController.text;
                              cubit.GetSearchData(text.toString());
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () async {
                              if (!_isListening) {
                                bool available = await _speech!.initialize(
                                  // ignore: avoid_print
                                  onStatus: (val) => print('onStatus: $val'),
                                  onError: (val) => print('onError: $val'),
                                );
                                if (available) {
                                  setState(() => _isListening = true);
                                  _speech!.listen(
                                    onResult: (val) => setState(() {
                                      _text = val.recognizedWords;
                                      searchController.text = _text;
                                      cubit.GetSearchData(
                                          searchController.text);
                                      if (val.hasConfidenceRating &&
                                          val.confidence > 0) {
                                        _confidence = val.confidence;
                                      }
                                    }),
                                  );
                                }
                              } else {
                                setState(() => _isListening = false);
                                _speech!.stop();
                              }
                            },
                            icon: Icon(
                              _isListening ? Icons.mic : Icons.mic_none,
                              size: 25,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                        child: FutureBuilder(
                      future: cubit.SearchList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return BuildSearchResult(
                                        context, snapshot.data![index]);
                                  },
                                  separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else
                          return Center();
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget BuildSearchResult(context, SearchModel model) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        onTap: () {
          BookCubit.get(context).GetBookDetailsData(model.id);
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
                      "http://ahmed686-001-site1.atempurl.com/${model.imageThumbnailUrl}",
                      width: 100,
                    ),
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
                          height: 7,
                        ),
                        Text(
                          "${model.name}",
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
            ],
          ),
        ),
      ),
    ]);
  }
}
