import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_abd_app/shared/cubit/cubit.dart';
import 'package:news_abd_app/shared/cubit/status.dart';
import 'package:news_abd_app/shared/net_work/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/home_layout.dart';
import 'package:news_abd_app/shared/style/theme_app.dart';

void main() {
  dioHelper.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit()..getBusinussData()),
      ],
      child: BlocConsumer<AppCubit, AppStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              home: homeLayote(),
              theme: myTheme.dark,
              darkTheme: myTheme.light,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark : ThemeMode.light

          );
        },
      ),
    );
  }
}
