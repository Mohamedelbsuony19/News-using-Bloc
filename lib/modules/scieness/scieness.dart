import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componente/componetes.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/status.dart';

class Scieness extends StatelessWidget {
  const Scieness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).scines;
        return articleBuilder(list);
      },
    );
  }
}
