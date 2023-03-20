import 'package:flutter/material.dart';
import 'package:news_app/Modules/web_view_screen/web_view.dart';
import 'package:news_app/Shared/search_cubit/cubit.dart';

const String noImage =
    "https://whiteknightpress.com/wp-content/uploads/2021/10/no-image-available.jpg";

Widget itemsBuilder(
    {required articles,
    scroll = const BouncingScrollPhysics(),
    bool shrink = false}) {
  return ListView.separated(
      physics: scroll,
      shrinkWrap: shrink,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: InkWell(
              onTap: () {
                navigateTo(
                    context: context,
                    page: WebViewScreen(articles[index]['link']));
              },
              child: Row(
                children: <Widget>[
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        articles[index]["image_url"] ?? noImage,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          articles[index]['title'] ?? 'No title available',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 15),
                        Text(
                          articles[index]['pubDate'] ??
                              'No published date available',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.white12,
          ),
        );
      },
      itemCount: articles.length);
}

void navigateTo({required context, required page}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Widget searchBar(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 20),
    child: Container(
      height: 38,
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(.09),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.teal)),
      child: TextFormField(
        onChanged: (value) {
          SearchCubit.get(context).searchFor(value);
        },
        cursorColor: Colors.grey,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 38 / 2,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusColor: Colors.grey,
            prefixIcon: Icon(
              Icons.search,
            ),
            prefixIconColor: Colors.teal,
            border: InputBorder.none),
      ),
    ),
  );
}
