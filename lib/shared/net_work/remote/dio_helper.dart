import 'package:dio/dio.dart';
class dioHelper{
 static Dio? dio;
// https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=5d206bbb4acc4f02ab757baef5a5c601
 static init(){
   dio=Dio(
     BaseOptions(
       baseUrl:'https://newsapi.org/',
       receiveDataWhenStatusError: true
     )
   );
 }
 Future<Response>getData({
   required String path,
   required Map<String,dynamic> qury})async{
   return await dio!.get(path,queryParameters: qury);
 }
}