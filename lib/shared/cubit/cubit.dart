import 'package:bloc/bloc.dart';
import 'package:news_abd_app/modules/business/business.dart';
import 'package:news_abd_app/modules/scieness/scieness.dart';
import 'package:news_abd_app/modules/settings/settings.dart';
import 'package:news_abd_app/modules/sport/sport.dart';
import 'package:news_abd_app/shared/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_abd_app/shared/net_work/remote/dio_helper.dart';


class AppCubit extends Cubit<AppStatus>{
  AppCubit():super(initAppState());
  static AppCubit get(context)=>BlocProvider.of(context);

  late int curent=0;
  late List<BottomNavigationBarItem>btnNavList=[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business
        ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports
        ),
      label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science
        ),
      label: 'Science'
    ),

  ];
  late List<Widget>Screens=[
    Business(),
    Sport(),
    Scieness(),
  ];
  void changeNavBar(index){
      curent=index;
      if(index==1){getSportsData();}
      else if(index==2){getScinessData();};
      emit(initAppState())
;  }

  late List<dynamic>business=[];
  void getBusinussData(){
emit(loadingGetDataBusinessState());
    dioHelper().getData(path: 'v2/top-headlines',
        qury: {'country':'eg',
          'category':'business',
          'apiKey':'5d206bbb4acc4f02ab757baef5a5c601'

        }).then((value){
          business=value.data['articles'];
          print(business[0]['title']);
          emit(getDataBusinessSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(getDataBusinessErorrState(e.toString()));
    });
  }

  late List<dynamic>sports=[];
  void getSportsData(){
    if(sports.length==0){
      emit(loadingGetDataSportsState());
      dioHelper().getData(path: 'v2/top-headlines',
          qury: {'country':'eg',
            'category':'sports',
            'apiKey':'5d206bbb4acc4f02ab757baef5a5c601'

          }).then((value){
        sports=value.data['articles'];
        emit(getDataBusinessSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(getDataSportsErorrState(e.toString()));
      });
    }else emit(getDataBusinessSuccessState());


  }

  late List<dynamic>scines=[];
  void getScinessData(){
    if(scines.length==0){

      emit(loadingGetDataScinceState());
      dioHelper().getData(path: 'v2/top-headlines',
          qury: {'country':'eg',
            'category':'science',
            'apiKey':'5d206bbb4acc4f02ab757baef5a5c601'

          }).then((value){
        scines=value.data['articles'];
        emit(getDataScinceSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(getDataScinceErorrState(e.toString()));
      });
    }else emit(getDataScinceSuccessState());


  }

  late List<dynamic>search=[];
  void getSearch(String value){
    
    emit(loadingGetDataSearchState());
    search=[];
    dioHelper().getData(
        path: 'v2/everything',
        qury: {

          'q':'$value',
          'apiKey':'5d206bbb4acc4f02ab757baef5a5c601'

        }).then((value){
      search=value.data['articles'];
      emit(getDataSearchSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(getDataSearchErorrState(e.toString()));
    });
  }

  bool isDark=false;
  void changeMode(){
    isDark = !isDark ;
    emit(changeThemeState());
    print('$isDark');
  }

}