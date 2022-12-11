import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_abd_app/modules/search/search.dart';
import 'package:news_abd_app/shared/cubit/cubit.dart';
import 'package:news_abd_app/shared/cubit/status.dart';
import 'package:news_abd_app/shared/net_work/remote/dio_helper.dart';

class homeLayote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStatus>(
      listener: (context, state) {
      },
      builder: (context, state) {
      var cubit =AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context)=>searchScreen()
                )
                );
              },
                  icon: Icon(Icons.search,size: 30,)),
              IconButton(onPressed: (){
                cubit.changeMode();
              },
                  icon: Icon(Icons.brightness_4_outlined,size: 30,))
            ],
          ),
          body: cubit.Screens[cubit.curent],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.btnNavList,
            currentIndex: cubit.curent,
            onTap: (index){
              cubit.changeNavBar(index);
            },
          ),
        );
      },
    );
  }
}
