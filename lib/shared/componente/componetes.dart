import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_abd_app/modules/webVeiw/webVeiw.dart';

Widget defaultFromFaild({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  dynamic onSubmit,
  dynamic onChange,
  dynamic ontab,
  bool isPasword = false,
  dynamic validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  dynamic sufixpressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPasword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: ontab,
      validator: validate,
      decoration: InputDecoration(
        fillColor: Colors.black12,
        filled: true,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        labelText: lable,
        labelStyle: TextStyle(fontSize: 16),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: sufixpressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
      style:Theme.of(context).textTheme.bodySmall,
    );

Widget buildArticleItem(BuildContext context, artical,
        {bool isSerach = false}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webVeiw(url: artical['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: NetworkImage(artical['urlToImage'] == null
                          ? 'https://storage.googleapis.com/afs-prod/media/c15325db3e2e4821bae95f0951f51100/3000.webp'
                          : '${artical['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${artical['title']}',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text(
                    '${artical['publishedAt']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );

Widget articleBuilder(
    list,
    {bool isSearch = false}) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => Container(
            color: Colors.black,
            height: 1,
          ),
          itemBuilder: (context, index) =>
              buildArticleItem(context, list[index]),
          itemCount: list.length,
        ),
    fallback: (context) => isSearch
        ? Container()
        : Center(
            child: CircularProgressIndicator(),
          ));
