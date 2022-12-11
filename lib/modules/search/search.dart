import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_abd_app/shared/cubit/cubit.dart';
import 'package:news_abd_app/shared/cubit/status.dart';

import '../../shared/componente/componetes.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late var searchControl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStatus>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [

                  defaultFromFaild(
                    context: context,
                      controller: searchControl,
                      type: TextInputType.text,
                      onSubmit: (v) {
                        AppCubit.get(context).getSearch(v);
                      },
                      lable: 'Search',
                      prefix: Icons.search_outlined),

                  Expanded(child: articleBuilder(list, isSearch: true))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// my old text field

//
