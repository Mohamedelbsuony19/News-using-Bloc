import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_abd_app/shared/componente/componetes.dart';
import 'package:news_abd_app/shared/cubit/cubit.dart';
import 'package:news_abd_app/shared/cubit/status.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).business;
        return articleBuilder(list);
      },
    );
  }
}
